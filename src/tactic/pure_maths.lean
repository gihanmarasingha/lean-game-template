/-
The contents of this file (apart from this comment) lifted from the natural number game by
Kevin Buzzard & Mohammad Pedramfar.
-/

-- Many many thanks to Rob Lewis for supplying 99.9% of this file.

import tactic.modded tactic.apply

open tactic

meta def copy_decl (d : declaration) : tactic unit :=
add_decl $ d.update_name $ d.to_name.update_prefix `pure_maths.interactive

@[reducible] meta def filter (d : declaration) : bool :=
d.to_name ∉ [`tactic.interactive.induction, 
             `tactic.interactive.cases, 
             `tactic.interactive.rw,
             `tactic.interactive.ring,
             `tactic.interactive.symmetry,
             `tactic.interactive.use]

meta def copy_decls : tactic unit :=
do env ← get_env,
  let ls := env.fold [] list.cons,
  ls.mmap' $ λ dec, when (dec.to_name.get_prefix = `tactic.interactive ∧ filter dec) (copy_decl dec)

@[reducible] meta def pure_maths := tactic

namespace pure_maths

--meta instance : monad pure_maths := by delta pure_maths; apply_instance

--meta instance : alternative pure_maths := by delta pure_maths; apply_instance

meta def step {α} (c : pure_maths α) : pure_maths unit := 
c >> return ()

meta def istep := @tactic.istep

meta def save_info := tactic.save_info

meta def execute (c : pure_maths unit) : pure_maths unit := 
c

meta def execute_with := @smt_tactic.execute_with
--meta def trace_state {α : Type}

meta def solve1 := @tactic.solve1

end pure_maths

--#check tactic.interactive.induction

namespace pure_maths.interactive

meta def induction
:= tactic.interactive.induction'

meta def cases
:= tactic.interactive.cases'

meta def rw
:= tactic.interactive.rw'

meta def ring
:= tactic.interactive.ring

meta def symmetry
:= tactic.interactive.symmetry'

meta def use
:= tactic.interactive.use'

end pure_maths.interactive

run_cmd copy_decls

--TODO : why is this broken?
--#print tactic.interactive.rintro

--#exit

-- example just to check it's running
/- example (n : ℕ) : true :=
begin [pure_maths]
  induction n,
    sorry, sorry  
end -/