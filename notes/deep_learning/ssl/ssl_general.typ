#let title = [
  Self-Supervised Learning
]
#set page(
  paper: "us-letter",
  numbering: "1",
  columns: 2,
)
#set text(
  font: "New Computer Modern",
  size: 10pt
)
#set par(justify: true)
#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 2em,
)[
  #align(center, text(17pt)[
    *#title*
  ])
]
#set heading(numbering: "1.")
#set math.mat(delim: "[")
#set math.vec(delim: "[")

= Contrastive Learning
Discriminative approaches learn representation by using objective functions that train networks on pretext tasks that have labels derived from an unlabeled dataset.
== SimCLR
No need for specialized architectures or memory banks. 
- Composition of multiple data augmentations is crucial for defining the contrastive prediction tasks.
- A learnable non-linear transform between the representation and contrastive loss improves the quality of representations learned.
- If contrastive cross-entropy is used, normalized embeddings and tuned tempreture is desirable.
- Larger batch-size with longer training.

=== Method
Create two correlated views from the same example by using data augmentations. These views form a positive pair $accent(x, tilde)_i, accent(x, tilde)_j$.

The base encoder $f(dot)$ extracts representations from examples to get $bold(h)_i = f(accent(x, tilde)_i)$ where $bold(h)_i in RR^d$ is the output after the average pooling layer.

The projection head $g(dot)$ maps representations to the contrastive-loss space. $bold(z_i) = h(bold(h)_i)$

The contrastive loss function is defined so that given a set ${accent(x,tilde)_k}$ including a positive pair, the task aims to identify $accent(x, tilde)_j in {accent(x, tilde)_k}_(k eq.not i)$ for a given $accent(x, tilde)_i$.

$ l_(i,j) = - log (exp("sim"(bold(z)_i, bold(z)_j) \/ tau))/ (sum^(2N)_(k=1, k eq.not i) exp("sim"(bold(z)_i, bold(z)_k) \/ tau )) $

#align(center ,image("simclr.png", width: 80%))

== MoCo
Methods using the contrastive loss can be thought of as building dynamic dictionaries. The keys in the dictionary are sampled from data and are represented by an encoder network. Unsupervised learning trains encoders to perform dicitonary look-up: an encoded query should be similar to its matching key and dissimilar to others.

Thus build a large and consistent dictionary through the training. Keys should be represented by a similar encoder so that thie comparisons to the query are consistent.

A queue of data samples is maintained, new encodings are queued and old ones are dequeued. As a results dictionary size is independent of the batch size. A slowly moving key-encoder is implemeted as a momentum-based moving average of the query-encoder.

=== Method
Consider an encoded query $q$ and a set of encoded samples ${k_0, k_1, k_2, ...}$ that are keys of a dictionary. Assume one of the keys, $k_+$ matches $q$. Loss is low when q is similar to $k_+$ and dissimilar to all other keys. This loss is the log loss of a $(K+1)$-way softmax-based classifier that tries to classify  $q$ as $k_+$.

Using a queue can make the dictionary large but it also makes it intractable to update the key encoder by back-propagation. As a result key encoder's weights are updated by:
$ theta_k arrow.l m theta_k + (1-m) theta_q $
Here, $m in [0,1)$ is a momentum coefficient. Only the parameters of the query-encoder is updated by back-propagation. As a result, though the keys in the queue are encoded by different encoders (in different batches), the differnence among them can be made small.

#align(center, figure(image("moco.png", height: 25%), caption: [Momentum Contrast (MoCo) trains a visual representation encoder by matching an encoded query q to a dictionary of encoded keys using a contrastive loss. The dictionary keys {k0, k1, k2, ...} are defined on-the-fly by a set of data samples. The dictionary is built as a queue, with the current mini-batch enqueued and the oldest mini-batch dequeued, decoupling it from the mini-batch size. The keys are encoded by a slowly progressing encoder, driven by a momentum update with the query encoder. This method enables a large and consistent dictionary for learning visual representations." ]))

= Clustering-based Methods 
== DeepCluster
The method consists of alternating between clustering of image descriptors and updating the weights of the network by predicting the cluster assignments. Requires little domain knowledge, no specific signal from the inputs.

A multilayer perpectron classifier on top of the last convolutional layer of a random AlexNet achieves 12% in accuracy on ImageNet, while the chance is at 0.1%. Seeing this one can use this innate property of convnets to get a rough representation and generate pseudo-labels by clustering the features.

=== How to avoid trivial solutions?
An optimal decision boundary is to assign all inputs to a single cluster. To solve "Feature quantization" can be used which automatically reassigns empty clusters by setting the empty centroid to a random non empty centroid plus a perturbation. The features belonging to the non empty centroid selected are split between the two.

If most features are assigned to a few clusters, with many singleton clusters; convnet predicts the same outputs regardless of input, trivial parameterization. To solve images are sampled based on a uniform distribution over classes, or pseudo-labels. Meaninig the loss contribution of an input is inversely proportional to its assigned classes' size.

== DeeperCluster


