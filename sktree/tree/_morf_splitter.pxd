# distutils: language = c++

# Authors: Adam Li <adam2392@gmail.com>
#          Chester Huynh <chester.huynh924@gmail.com>
#          Parth Vora <pvora4@jhu.edu>
#
# License: BSD 3 clause

# See _oblique_splitter.pyx for details.

import numpy as np

cimport numpy as cnp
from libcpp.vector cimport vector
from sklearn.tree._splitter cimport SplitRecord
from sklearn.tree._tree cimport DOUBLE_t  # Type of y, sample_weight
from sklearn.tree._tree cimport DTYPE_t  # Type of X
from sklearn.tree._tree cimport INT32_t  # Signed 32 bit integer
from sklearn.tree._tree cimport SIZE_t  # Type for indices and counters
from sklearn.tree._tree cimport UINT32_t  # Unsigned 32 bit integer
from sklearn.utils._sorting cimport simultaneous_sort

from ._oblique_splitter cimport BaseObliqueSplitter, ObliqueSplitRecord


cdef class PatchSplitter(BaseObliqueSplitter):
    # The PatchSplitter creates candidate feature values by sampling 2D patches from
    # an input data vector. The input data is vectorized, so `data_height` and
    # `data_width` are used to determine the vectorized indices corresponding to
    # (x,y) coordinates in the original un-vectorized data.

    cdef public SIZE_t max_patch_height                 # Maximum height of the patch to sample
    cdef public SIZE_t max_patch_width                  # Maximum width of the patch to sample
    cdef public SIZE_t min_patch_height                 # Minimum height of the patch to sample
    cdef public SIZE_t min_patch_width                  # Minimum width of the patch to sample
    cdef public SIZE_t data_height                      # Height of the input data
    cdef public SIZE_t data_width                       # Width of the input data

    # All oblique splitters (i.e. non-axis aligned splitters) require a
    # function to sample a projection matrix that is applied to the feature matrix
    # to quickly obtain the sampled projections for candidate splits.
    cdef void sample_proj_mat(
        self, 
        vector[vector[DTYPE_t]]& proj_mat_weights,
        vector[vector[SIZE_t]]& proj_mat_indices
    ) nogil 
