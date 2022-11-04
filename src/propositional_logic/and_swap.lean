import tactic.pure_maths -- hide

/-
# Propositional logic
## Level 3: And swap

-/

namespace exlean -- hide

variables {p q : Prop} -- hide

/-
## Task

Intuitively, you'd expect that if you have $h : p \land q$, then you can derive $q \land p$.
In this level, you'll do just that!

Recall you can:
* use `cases`, or `.left` and `.right` for and elimination and
* use `split` or `and.intro` for and introduction.
-/

/- Theorem :
Let $p$ and $q$ be propositions. Assuming $h : p \land q$, we have $h : q \land p$.
-/
theorem and.swap (h : p ∧ q) : q ∧ p :=
begin
  split,
  { show q, from h.right, },
  { show p, from h.left, },







end

end exlean -- hide