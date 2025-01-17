.. _api_documentation:

=================
API Documentation
=================

:py:mod:`sktree`:

.. automodule:: sktree
   :no-members:
   :no-inherited-members:

Supervised
----------
Decision-tree models are traditionally implemented with axis-aligned splits and
storing the mean outcome (i.e. label) vote in the leaf nodes. However, more
exotic splits are possible, called "oblique" splits, which are some function
of multiple feature columns to create a "new feature value" to split on.

This can take the form of a random (sparse) linear combination of feature columns,
or even take advantage of the structure in the data (e.g. if it is an image) to
sample feature indices in a manifold-aware fashion. This class of models generalizes
the splitting function in the trees, while everything else is consistent with
how scikit-learn builds trees.

.. currentmodule:: sktree
.. autosummary::
   :toctree: generated/

   ObliqueRandomForestClassifier
   PatchObliqueRandomForestClassifier

.. autosummary::
   :toctree: generated/

   tree.ObliqueDecisionTreeClassifier
   tree.PatchObliqueDecisionTreeClassifier

Unsupervised
------------
Decision-tree models are traditionally used for classification and regression.
However, they are also powerful non-parametric embedding and clustering models.
The :class:`~sklearn.ensemble.RandomTreesEmbedding` is an example of unsupervised
tree model. We implement other state-of-the-art models that explicitly split based
on unsupervised criterion such as variance and BIC.

.. currentmodule:: sktree
.. autosummary::
   :toctree: generated/
   
   UnsupervisedRandomForest
   UnsupervisedObliqueRandomForest

.. autosummary::
   :toctree: generated/
   
   tree.UnsupervisedDecisionTree
   tree.UnsupervisedObliqueDecisionTree
