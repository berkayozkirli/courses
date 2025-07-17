#let title = [
  Mechanics
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

= Vectors and Kinematics
$bold(F) = m bold(a)$ is shown in vector notation. Vectors simplify equations. For now we can think fo them as directed line segments, to descrbe it one needs both its direction and length. Two vectors that have the same length and direction are equal. Magnitude is denoted with the notation $|bold(A)|$. If the length of a vector is one unit, it is called a unit vector $ bold(accent(A, "^")) = bold(A) / (|bold(A)|)$ and conversely = $bold(A) = |bold(A)| bold(accent(A, "^"))$.
== Vector Algebra
=== Scalar Product (Dot Product)
The result of this operation is a scalar, its defined as $A dot B eq.def |bold(A)| |bold(B)|cos theta$. $theta$ is the angle between the vectors if they are laid on a plane with their tails coinciding. $|bold(B)| cos theta$ is the projection of $bold(B)$ along the direction of $bold(A)$. If vectors are perpendicular their dot product is 0.
=== Vector Product (Cross Product)
The result of this operation is a vector $ bold(C) = bold(A) times bold(B)$, its magnitude is defined as $|bold(C)| = |bold(A)| |bold(B)| sin theta$. $theta$ is always taken as the angle smaller than $pi$, if $theta = 0$ then we get 0.

Two vectors lie on a plane, if they aren't parallel or antiparallel.