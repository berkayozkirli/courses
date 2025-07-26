#let title = [
  Math for CS
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
// Table rules:
#show table.cell.where(y: 0): strong
#set table(  stroke: (x, y) => (
    left: if x > 0 { 0.8pt },
    top: if y > 0 { 0.8pt },
  )
)

#set heading(numbering: "1.")
= Predicates, Sets, and Proofs
== What is a Proof?
A method of ascertaining truth.
- Experiments and observations
- Sampling
- Legal preceding
- Authority and religion
- Inner conviction
A mathematical proof is a verification of a proposition by a chain of logical deductions from a base set of axioms.

A proposition is a statement that can be true or false.

A predicate is like a proposition that contains variables, it is true for some values of the variables and false for others. If quantified it becomes a proposition.

*Goldbach's Conjecture*: Every even number greater than 2 is the sum of two prime numbers.

Logical operators $not and or arrow$ can be used to form compound propositions.

#table(
  columns: 2,
  table.header([$A$], [$not A$]),
  [$ T $], [$ F $],
  [$ F $], [$ T $],
)
#table(
  columns: 4,
  table.header([$A$], [$B$], [$A and B$], [$A or B$]),
  [$ T $], [$ T $], [$ T $], [$ T $],
  [$ T $], [$ F $], [$ F $], [$ T $],
  [$ F $], [$ T $], [$ F $], [$ T $],
  [$ F $], [$ F $], [$ F $], [$ F $],
)
