#let title = [
  Probabilistic Systems Analysis and Applied Probability
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
= Probability Models and Axioms
Sample Space: Description of all things that may happen during a random experiment.

Probability Law: Our beliefs about which outcomes are more likely to occur.

Sample spaces $Omega$ are sets that contain all the possible things that can happen as a result of an experiment. Elements of this set need to be mutually exclusive and collectively exhaustive.

example: $Omega = {(x,y)| 0 lt.eq x,y lt.eq 1}$

An event is a subset of the sample space, probability is assigned to events.

Axioms:
- Nonnegativity: $P(A) gt.eq 0$
- Normalizaiton: $P(Omega) = 1$
- Addtivity: If $A inter B = emptyset$ then $P(A union B) = P(A) + P(B)$



