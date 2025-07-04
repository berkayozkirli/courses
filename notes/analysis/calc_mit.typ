#let title = [
  Calculus
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
= Single Variable Calculus
== Differentiation
=== What is a derivative
*Geometrically* Find the tangent line to $y=f(x)$ at $p = (x_0, y_0)$. $y - y_0 = m(x - x_0)$ gives the line passing through $(x_0, y_o)$, we need to find $m$.

_Definition_ $f'(x_0)$, the derivative of f at $x_0$, is the slope of the tangent line to $y=f(x)$ at point $p=(x_0,y_0)$

$ m = f'(x_0) = lim_(Delta x arrow 0) (Delta f)/(Delta x) = (f(x_0 + Delta x) - f(x_0)) / (Delta x) $

Many rules can be driven using the above formula for common functions.

$ d / (d x) x^n = n x^(n-1) $

*Physically* Derivative is the "instantaneous" rate of change.

=== How to differentiate anything?
*Limits and Continuity* Derivatives are always harder than the trivial limits which involve simply plugging in the limiting value. 

$ lim_(x arrow x_0^+) f(x) "is the right-hand limit" $

$ lim_(x arrow x_0^-) f(x) "is the left-hand limit" $

_Definition_ $f(x)$ is continuous at $x_0$ means $lim_(x arrow x_0) f(x) = f(x_0)$. Thus the limit must exist from both left and right and they need to be the same.

- Jump Discontinuity: limits from left and right exist but they are not equal.

- Point Discontinuity: removable discontinuity, limit from left and right are equal but do not equal to the functions value.

- Infinite Discontinuity:  limits go to $infinity$

- Other Discontinuities: many possible ways, no limits etc.

_Theorem_ If $f$ is differentiable at $x_0$ then $f$ is continuous at $x_0$

_Proof_ $lim_(x arrow x_0) f(x) - f(x_0) =^? 0$
$ lim_(x arrow x_0) (f(x) - f(x_0)) / (x - x_0) (x-x_0) = f'(x_0) * 0 = 0 $

This is possible as limits never use the value at the limiting point as a result no division by 0.

*Useful Formulas* 

$ sin(a+b) = sin(a)cos(b) + cos(a)sin(b) $
$ cos(a+b) = cos(a)cos(b) - sin(a)sin(b) $
$ lim_(theta arrow 0) (cos theta - 1) / (theta) = 0 $
$ lim_(theta arrow 0) (sin theta) / (theta) = 1 $

*Derivative Formulas* 
$ sin' x &= cos x 
\ cos' x &= -sin x 
\ tan' x &= 1 / (cos^2x)
\ (c u)' &= c u' 
\ (u+v)' &= u' + v' 
\ (u v)' &= u'v + u v' 
\ (u/v)' &= (u'v - u v') / v^2
\ u(v(x))' &= u'(v(x)) * v'(x) $

*Implicity Differentiation* indicates taking the derivative of the dependent variable with respect to the independent one, doing some algebraic manipulations and resubstituting the depenent variable by the independent variable. When taking derivatives of inverse functions implicit differentiation can be used readily.


