let maxargs s = 
  match s with  
  | CompoundStm (s1, s2) -> max(maxargs s1) (maxargs s2)
  | AssigStm (_, e) -> maxargs_exp e 
  | PrintStm exs -> maxargs_exp_list e

  (* declaracao de tipos mutuamente recursivos *)
and maxargs_exp e =
  match e with
  | IdExp _ -> 0
  | NumExp _ -> 0
  | OpExp (el, _, e2) -> max (maxargs_exp e1) (maxargs_exp e2)
  | EseqExp (s, e) -> max (maxargs s) (maxargs_exp e)

and maxargs_exp_list list = 
  match list with 
  | [] -> 0
  | e :: es -> max (maxargs_exp e) (maxargs_exp_list es)
