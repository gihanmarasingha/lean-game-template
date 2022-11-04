import propositional_logic.imp_elim -- hide

/-
# Propositional logic
## Level 5: Implication introduction

To prove $p \to q$ it to assume $p$ and derive $q$.

In Lean, if the target is `p → q`, typing `assume h : p` introduces `h : p` into the context
and replaces the target with one of proving `q`.

Here, we prove $(p \land q) \to p$.
-/

variables (p q : Prop) -- hide

example : (p ∧ q) → p :=
begin
  assume h : p ∧ q,
  show p, from h.left,
end

namespace hidden -- hide

/-
A useful result, `id` asserts that `s → s`, for any `s`.
-/

/- Axiom : id {p} :
p → p
-/

variable (s : Prop) -- hide

lemma id : s → s :=
begin
  assume h : s,
  show s, from h,
end


end hidden -- hide

namespace exlean -- hide

/-
In the fun example below, we prove $p \to (q \to p)$.
-/

example : p → (q → p) :=
begin
  assume h₁ : p,
  show q → p,
  assume h₂ : q,
  show p, from h₁,
end


/-
## Task

Prove the following result in Lean.
-/


/- Theorem : no-side-bar
Let $p$ and $q$ be propositions. Then $(p \land q) \to p$.
-/
theorem imp_intro_example : (p ∧ q) → p :=
begin
  assume h : p ∧ q,
  show p, from h.left,




end

end exlean -- hide