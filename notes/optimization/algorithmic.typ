#let title = [
  Algorithms for Optimization
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
== History of Optimization
Optimization problems are ofthen posed as a search in a space defined by set of coordinates. Lagrange unified tools from calculus and algebra to solve constrained optimization problems, he introduced Lagrange multipliers which transform a constrained optimization problem into an unconstrained one. Since the invetion of digital computer methods such as the simplex algorithm for solving linear programming roblems and dynamic programming for solving problems with a recursive structure have been developed.
== Mathematical Formulation
Optimization problems can be formulated as follows:

$ "minimize" f(x) "subject to" x in X $

*x* is a _design point_ which can be represented as a vector of values corresponding to design variables. Any value of *x*  in the _feasible set_ X that minimizes the objective function is called a solution.Constraints define the _feasible set_ X.



