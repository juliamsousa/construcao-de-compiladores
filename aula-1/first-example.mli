type id = string
type binop = Plus | Minus | Times | Div
type stm =
    CompoundStm of stm * stm
  | AssignStm of id * exp
  | PrintStm of exp list
and exp =
    IdExp of id
  | NumExp of int
  | OpExp of binop * exp * exp
  | EseqExp of stm * exp
val p1 : stm
val p2 : stm
