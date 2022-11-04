import data.int.basic tactic.pure_maths -- hide

/-
# Propositional logic
## Level 1: And elimination

Let $p$ and $q$ be propositions (mathematical statements). The formal statement $p \land q$
(read '$p$ conjunction $q$')
corresponds to the informal statement '$p$ and $q$'.

Suppose you are given a hypothesis `h : p ∧ q`. Then

1. [left and elimination] `h.left` is a proof of `p` and
2. [right and elimination] `h.right` is a proof of `q`.

Here, `h.left` is an abbreviation for `and.elim_left h`. Likewise for `h.right`.

**Theorem**: Let $x$ be an integer. Supose $h : (x > 0) \land (x ^ 2 = 16)$. Then $x ^ 2 = 16$.

**Proof**: The result follows from right and elimination on $h$. ∎

The Lean proof is below.

**Notation**: the symbol `∧` in Lean is typed `\and`.
-/


/- Axiom : and.elim_left (h : p ∧ q) :
p
-/

/- Axiom : and.elim_right (h : p ∧ q) :
q
-/



example (x : ℤ) (h : (x > 0) ∧ (x * x = 16)) : x * x = 16 :=
begin
  from h.right,
end

/-
Alternatively, the `cases` tactic will decompose the `∧` into both the left and right sides.
Below `cases h with h₁ h₂` decomposes `h` into `h₁ : x > 0` and `h₂ : x * x = 16`.
-/

example (x : ℤ) (h : (x > 0) ∧ (x * x = 16)) : x * x = 16  :=
begin
  cases h with h₁ h₂,  
  show x * x = 16, from h₂,
end



/-
Frequently, we consider the conjunction of several statements. 
We can, for instance, derive $q$ given the assumption $p \land (q \land r).
-/

example (p q r : Prop) (h : p ∧ (q ∧ r)) : q :=
begin
  have h₂ : q ∧ r, from h.right,
  show q, from h₂.left,
end


/- Tactic : cases
`cases` is a general-purpose elimination tactic. It it used to 'decompose' a hypothesis into
its constituent parts.

### Examples

* Given `h : ∃ (x : ℤ), x + 5 = y`, typing `cases h with m h₂` replaces `h` with `m : ℤ` and
`h₂ : m + 5 = y`.

* Given `h : p ∧ q`, typing `cases h with hp hq` replaces `h` with `hp : p` and `hq : q`.

* Given `h : p ∨ q`, typing `cases h with hp hq` replaces the current goal with two goals
(1) in which `h` is replaced with `hp : p` and (2) in which `h` is replaced with `hq : q`.

* Given `x : ℕ`, typing `cases x with k` replaces the goal with two new goals: (1) a goal in which
every occurence of `x` is replaced with `0` and (2) a goal with a new variable `k : ℕ` and in 
which every occurrence of `x` is replaced with `succ k`.

* Given `h : ∃ (x : X), P(x)`, typing `cases h with y h₂` introduces a new variable `y : X`
and replaces `h` with `h₂ : P(y)`.
-/


namespace exlean -- hide

/-
## Tasks

1. Replace `sorry` below with a Lean proof using `have` together with left and right and elimination.
Adapt the proof of the example above.
2. Write another Lean proof using `cases`.
3. On a piece of paper, state and give a handwritten proof of this result.
-/

/- Theorem : no-side-bar
Let $p$, $q$, and $r$ be propositions. Assuming $h : (r \land (p \land q)) \land r$,
we have $q$.
-/
theorem decomposing_and (p q r : Prop) (h : (r ∧ (p ∧ q)) ∧ r) :
q :=
begin
  have h₂ : r ∧ (p ∧ q), from h.left,
  have h₃ : p ∧ q, from h₂.right,
  show q, from h₃.right,





end

end exlean -- hide