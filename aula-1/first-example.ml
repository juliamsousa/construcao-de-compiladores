(** abstract syntax tree **)
(* 
  esse modelo representa uma árvore de expressões
   separando os operadores e expressoes 
*)

(* aqui apenas renomeamos o tipo string *)
type id = string
type binop = Plus | Minus | Times | Div

(* o oCaml tambem apresenta o casamento de padroes semelhante a Haskell *)
(* os cosntrutores abaixo enumeram quais os formatos que o dado pode adquirir *)
type stm =
(** aqui temos possibilidades que essa variavel pode receber **)
(* abaixo temos um cosntrutor de tipos *)
  | CompoundStm of stm * stm
  | AssignStm of id * exp
  | PrintStm of exp list

  (* 
    os tipos stm e exp sao mutuamente recursivos, 
    a declaracao de um depende da declaracao de outro 
    desse modo suas declaracoes devem ser feitas simultaneamente

    o operador and permite fazer essa declaracao ao mesmo tempo
  *)
and exp = 
  | IdExp of id
  | NumExp of int
  | OpExp of binop * exp * exp
  | EseqExp of stm * exp

  (* quando temos um unico parametro nao é necessario colocar entre parenteses *)
  let p1 = AssignStm ("x", NumExp 3)

  (* isso equivale a print(x, x+1) *)
  let p2 = PrintStm [IdExp "x"; OpExp(Plus, IdExp "x", NumExp 1)]
