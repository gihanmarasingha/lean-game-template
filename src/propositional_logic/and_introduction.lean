import tactic.pure_maths -- hide

/-
# Propositional logic
## Level 2: And introduction

## And introduction

To *prove* $p\land q$ is to prove $p$ and to prove $q$.

In Lean, if `h₁ : p` is a proof of `p` and `h₂ : q` is a proof of `q`, then `and.intro h₁ h₂`
is a proof of `p ∧ q`.
-/

example (p q : Prop) (h₁ : p) (h₂ : q) : p ∧ q :=
begin
  from and.intro h₁ h₂,
end

/-
The `split` tactic is an alternative (backward) proof technique. If the target is to prove `p ∧ q`,
then `split` replaces the goal with two new goals: (1) to prove `p` and (2) to prove `q`.
-/

example (p q : Prop) (h₁ : p) (h₂ : q) : p ∧ q :=
begin
  split,
  { show p, from h₁, }, -- The first goal.
  { show q, from h₂, }, -- The second goal.
end


namespace exlean -- hide
/-
## Tasks

1. Replace `sorry` below with a Lean proof using `and.intro`.
2. Write another Lean proof using `split`.
3. On a piece of paper, state and give a handwritten proof of this result.

**Notation**: Recall that `h₁` is written `h\1`.
-/

/- Tactic : split

The `split` tactic splits a 'compound' target into multiple goals. 

### Examples

`split` turns the target `⊢ p ∧ q` into two goals: (1) `⊢ p` and (2)  `⊢ q`.

Equally, if the target is `⊢ p ↔ q`, split creates the goals (1) to prove
`p → q` and (2) to prove `q → p`.
-/


/- Axiom: and.intro (h₁ : p) (h₂ : q) :
p ∧ q
-/

variables (p q r : Prop) -- hide


/- Theorem : no-side-bar
Let $p$, $q$, and $r$ be propositions. Assuming $h_1 : p$, $h_2 : q$, and $h_3 : r$, we have
$h : r \land q$.
-/
theorem and_intro_thm (h₁ : p) (h₂ : q) (h₃ : r) : r ∧ q :=
begin
  split,
  { show r, from h₃, },
  { show q, from h₂, },


end

end exlean -- hide