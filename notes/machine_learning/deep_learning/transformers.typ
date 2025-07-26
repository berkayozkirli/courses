#let title = [
  Transformers
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
= Introduction
= Normalization
Data normalization rescales the input so that features have the same range, mean, variance etc.

Activation normalization occurs in between the layers of a deep architecture.
== Batch Normalization
Operates on the activations of a layer for each batch. let's say we have activations $x_((1))^((l)), x_((2))^((l)),...,x_((B))^((l))$ after the $l$th layer of the network for the batch of inputs $x_((1))^((0)), x_((0))^((l)),...,x_((B))^((0))$
$ mu_i^((l)) = 1 / B sum_(b=1)^B x_((b),i)^((l)) $ 
$ (sigma_i^((l)))^2 = 1 / B sum_(b=1)^B ( x_((b),i)^((l)) - mu_i^((l)) )^2 $

where $i$ indexes the coordinates of the vectors and $b$ indexes the elements of the batch. Mean and variance is, thus, computed across the $i$th value in each vector in the batch. After normalizing each index to have zero mean and unit variance a linear transformation is applied $bold(y^((l))_((b))) = bold(gamma) bold(x_((b))^((l))) + bold(beta)$

```python
import numpy as np

def batchnorm(x, gamma, beta, epsilon=1e-9):
  # Mean and variance of each feature
  mu = np.mean(x, axis=0)  # shape (N,)
  var = np.var(x, axis=0)  # shape (N,)

  # Normalize the activations
  x_hat = (x - mu) / np.sqrt(var + epsilon)  
  # shape (B, N)

  # Apply the linear transform
  y = gamma * x_hat + beta  # shape (B, N)

  return y
```

== Layer Normalization
