import propositional_logic.and_swap -- hide

/-
# Propositional logic
## Level 4: Implication elimination

Given proofs of $p \to q$ ($p$ implies $q$) and $p$, you know $q$. This is *implication elimination*,
sometimes called *modus ponens*.

In Lean, if `h₁ : p → q` is a proof of `p → q` and `h₂ : p` is a proof of `p`, then `h₁ h₂` is a proof
of `q`.

**Notation**: The symbol `→` is typed `\r`.
-/

variables (p q r : Prop) -- hide

example (h₁ : p → q) (h₂ : p) : q :=
begin
  from h₁ h₂
end

/-
As an example, we'll prove $r$ on the assumptions $h_1 : p \to (q \land r)$ and $h_2 : p$.
-/

example (h₁ : p → (q ∧ r)) (h₂ : p) : r :=
begin
  have h₃ : q ∧ r, from h₁ h₂,
  show r, from h₃.right,
end

namespace exlean -- hide
/-
## Task

Prove the following result in Lean.
-/


/- Theorem : no-side-bar
Let $p$, $q$, and $r$ be propositions. Assuming $h_1 : p \to q \land r$ and $h_2 : p$, we have $q$.
-/
theorem imp_elim_example (h₁ : p → q ∧ r) (h₂ : p) : q :=
begin
  have h₃ : q ∧ r, from h₁ h₂,
  show q, from h₃.left,








end

end exlean -- hide