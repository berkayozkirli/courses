#let title = [
  Emerging Properties in Self-Supervised 
  
  Vision Transformers
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

- Self-supervised ViT features explicitly contain the scene layout and object boundaries. This information is directly accesible in the self-attention modules of the last block.

- Self-supervised ViT features perform particularly well with a basic nearest neighbors classifier without any finetuning, linear classifier nor data augmentation.

- Smaller patches need to be used in order to improve the qualty of features.

DINO, directly predicts the output of a teacher network, built with a momentum encoder, by using a standart cross-entropy loss. Method can work only with centering and sharpening of the teacher output to prevent collapse.

#image("dino.png")

Knowledge distillation is a learning paradigm where a student network $g_(theta_s)$ is trained to match the output of a given teacher network $g_(theta_t)$, parameterized by $theta_s$ and $theta_t$ respectively. Given an input image $x$, both networks output probability distributions over $K$ dimensions denoted by $P_s$ and $P_t$. the probability $P$ is obtained by normalizing the output of the network $g$ with a softmax function.

$ P_s (x)^((i)) = exp(g_theta_s (x)^((i)) \/ tau_s) / (sum_(k=1)^(K) exp(g_theta_s (x)^((k)) \/ tau_s)) $

$tau_s$ is a tempreture parameter that controls the sharpness of the output distribution, and a similar formula holds for $P_t$ with tempreture $tau_t$.

$ min_(theta_s) H(P_t (x), P_s (x)) , H(a,b) = a -log b $

Is the cross-entropy loss being minimized with respect to $theta_s$ in order to match the distributions.

Different distorted views or crops of an image is generated. A total $V$ different views including two global views $x_1^g, x_2^g$ and several local views of smaller resolution. All crops are passed through the student while only global views are passed through the teacher.

$ min_theta_s sum_(x in {x_1^g, x_2^g}) sum_(x' in V \ x' in.not x) H(P_t (x), P_s (x')) $

Here local views in $V$ are of size $(96, 96)$ and global views in $V$ are of size $(224,224)$.

Student and teacher are the same architecture $g$ with a different set of parameters $theta_s$ and $theta_t$. $theta_s$ is learned by minimizing the above equation. Since there is no a priori teacher $g_theta_t$ it needs to built from the past iterations of the student network. Teacher network is updated with the rule $theta_t arrow.l lambda theta_t + (1- lambda)theta_s$, with lambda following a cosine scheduling regime from 0.996 to 1. "We observe that this teacher has better performance than the student throughout the training, and hence, guides the training of the student by providing  target features of higher quality. This dynamic was not observed in previous works"

ViT does not uae batch norms, thus DINO also doesn't use them.

To preevent collapse either contrastive loss, clustering constraints, predictor or batch normalizations are used. Even though it is possible to stabilize th framework with norms, centering and sharpening of the momentum teacher outputs work as well. Centering prevents one dimension to dominate but encourages collapse to the uniform distribution, while the sharpening has the opposite effect.

$ g_t (x) &arrow.l g_t (x) + c "where," \
  c &arrow.l m c + (1-m)1/B sum^B_(i=1) g_theta_t (x_i) $

  Above equation describes the centering equation, sharpening is obtained by using a low value for the temperature $tau_t$ in the teacher softmax normalization.