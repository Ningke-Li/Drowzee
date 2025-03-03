open List

(***************************************)
(************   Pure   **************)
(***************************************)
type value = BINT of int | BVAR of string | BSTR of string | ANY



type terms = Basic of value 
           | Plus of terms * terms
           | Minus of terms * terms 
           | TPredicate of string * (terms list )
           | List of listStructure 
           | Tuple of terms list 

and listStructure = Enumarate of terms list | HeadTail of (terms * terms)


       
(*Arithimetic pure formulae*)
type pure = TRUE
          | FALSE
          | Gt of terms * terms
          | Lt of terms * terms
          | GtEq of terms * terms
          | LtEq of terms * terms
          | Eq of terms * terms
          | PureOr of pure * pure
          | PureAnd of pure * pure
          | Neg of pure
          | Predicate of (string * terms list)

(***************************************)
(************   MTL   **************)
(***************************************)

type relation = string * (terms list) 


type propositions = relation (* Relation of relation | PureAP of pure *)

type dd = int 
type mm = int 
type year = int 
type date = (dd * mm * year)

type endInterval = int (*Int of int | Infinity *)
type interval = (int * endInterval)

type mtl = 
  Atom of propositions 
| Neg of mtl 
| Conj of mtl * mtl 
| Disj of mtl * mtl 
| Imply of mtl * mtl 
| Globally of interval * mtl 
| Finally  of interval * mtl 
| Next     of mtl  (* immidiate next state *)
| Until    of interval * mtl * mtl 


(***************************************)
(************   Prolog   **************)
(***************************************)

type basic_Type = Number | Symbol
type param  = string * basic_Type
type decl = string * (param list)


type head = relation
type body = Pos of relation 
    | Neg of relation 
    | Pure of pure 
    | Assign of (string * terms) 
    | IfElse of (pure * body * body) 
    | EqAssign of (string * terms)
type rule = head * (body list) 
type prolog = (*decl list * *) rule list 

let (executeCMD: (relation list) ref) = ref []
(**************Keywords*********************)

let basic_n n = Basic(BINT n)
let basic_s n = Basic(BSTR n)
let basic_v n = Basic(BVAR n)


let eventKeyword  = "Event"
let endKeyword = "end"
let beginKeyword = "begin" 
let check_queryKeyword =  "check_query"

let startKeyTerm = basic_v "Start"
let endKetTerm = basic_v "End"

let start_end_args =[startKeyTerm;endKetTerm] 

let defaultConstrint = Pure(LtEq(startKeyTerm, endKetTerm))




(***************************************)
(************   NingKe Li   **************)
(***************************************)


let mtlGeneratorTests: (mtl * int) list = 
  let ap = (Atom ("iraq_War", [])) in 
  let ap2 = (Atom ("ev2", [])) in
  let disjunction = Disj (ap, ap2), 2101 in 


  (* 
  let (neg_ap:(mtl*int)) = Neg (ap), 2024 in (* [(0, 2002), (2012, 2024)] *)

  let until_test = Until ((10, 35), ap, ap2), 2003 in 

  let globally_ap = (Globally ((20, 30) , ap), 2021)  in  (* 1980 - 2020 *)
  let next_ap = Next (ap), 2050 in (* 1999-2049 *)
  let finally_ap = Finally ((10, 12) , ap), 2041 in (* 1988-2040 *)
  let conjunction = Conj (ap, ap2), 2011 in 
  let (negAP:mtl * int) = Neg(ap), 2011 in 
  let (imply:mtl * int) = Imply(ap2, ap), 2011 in 
  *)

  [
    (*ap2, 2101 *) 
    disjunction
    
  ]


(***************************************)
(************   Yahui Song   **************)
(***************************************)


let string_of_basic_t v = 
  match v with 
  | BVAR name ->  name
  | BSTR s ->  "\'" ^ s ^ "\'"
  | BINT n -> string_of_int n
  | ANY -> "_"


let rec string_of_terms (t:terms):string = 
  let rec string_of_list_terms termLi = 
    match termLi with 
    | [] -> ""
    | [x] -> string_of_terms x 
    | x :: xs  -> string_of_terms x ^ "," ^ string_of_list_terms xs 
  in 
  let string_of_listStructure structure = 
    match structure with 
    | Enumarate termLi -> string_of_list_terms termLi 
    | HeadTail (a, b) -> string_of_terms a ^ " | " ^ string_of_terms b 
  in 
  match t with
  | Basic v -> string_of_basic_t v 
  | Plus (t1, t2) -> "(" ^ (string_of_terms t1) ^ ("+") ^ (string_of_terms t2) ^ ")" 
  | Minus (t1, t2) -> "(" ^  (string_of_terms t1) ^ ("-") ^ (string_of_terms t2) ^ ")" 
  | TPredicate (str, tLi) -> str ^ "(" ^  (string_of_list_terms tLi) ^ ")" 
  | Tuple termLi -> "(" ^  string_of_list_terms termLi ^ ")" 
  | List listStructure -> "[" ^  string_of_listStructure listStructure ^ "]" 


let rec string_of_list_terms tL: string = 
  match tL with 
  | [] -> ""
  | [t] -> string_of_terms t 
  | x :: xs ->  string_of_terms x ^", "^ string_of_list_terms xs 


let rec string_of_pure (p:pure):string =   
  match p with
    TRUE -> (*"⊤" *) "true"
  | FALSE -> "⊥"
  | Gt (t1, t2) -> (string_of_terms t1) ^ ">" ^ (string_of_terms t2)
  | Lt (t1, t2) -> (string_of_terms t1) ^ "<" ^ (string_of_terms t2)
  | GtEq (t1, t2) -> (string_of_terms t1) ^ ">=" ^ (string_of_terms t2) (*"≥"*)
  | LtEq (t1, t2) -> (string_of_terms t1) ^ "=<" ^ (string_of_terms t2) (*"≤"*)
  | Eq (t1, t2) -> (string_of_terms t1) ^ "=" ^ (string_of_terms t2)
  | PureOr (p1, p2) -> "("^string_of_pure p1 ^ "∨" ^ string_of_pure p2^")"
  | PureAnd (p1, p2) -> string_of_pure p1 ^ "∧" ^ string_of_pure p2
  | Neg (Eq (t1, t2)) -> "("^(string_of_terms t1) ^ "!=" ^ (string_of_terms t2)^")"
  | Neg (Gt (t1, t2)) -> "("^(string_of_terms t1) ^ "=<" ^ (string_of_terms t2)^")"
  | Neg p -> "!(" ^ string_of_pure p^")"
  | Predicate (str, termLi) -> str ^ "(" ^ string_of_list_terms termLi ^ ")"



let string_of_param x =     
  match x with
  (n, Number) -> n ^ ":number"
| (s, Symbol) -> s ^ ":symbol" 


let rec expand_args (sep: string) (x:string list) = 
  match x with 
  [] -> ""
  | [x] -> x
  | x :: xs -> x ^ sep ^ (expand_args sep xs)

let replace_special_characters (s: string) : string =
  let s = String.lowercase_ascii s in
  let re = Str.regexp "[^a-zA-Z0-9]" in
  Str.global_replace re "_" s

let string_of_relation (relation:relation) =
  match relation with
  (name,vars) -> 
  let variables = expand_args "," (List.map string_of_terms vars) in name ^ "(" ^ variables ^ ")"  
  
let rec string_of_bodies (bodies:body list) = 
  expand_args ", " (List.map (fun body -> match body with
    Pos r -> string_of_relation r
  | Neg r -> "!"  ^ string_of_relation r
  | Pure p -> string_of_pure p 
  | Assign (str, terms) -> str ^ " is " ^ string_of_terms terms
  | EqAssign (str, terms) -> str ^ " = " ^ string_of_terms terms
  | IfElse (pure, thenBranch, elseBranch) -> "("  ^
    string_of_pure pure ^ " -> " ^ string_of_bodies [thenBranch] ^ ";" ^ string_of_bodies [elseBranch]
  ^ ")"

            (*
      check_query() :-
    (iraq_war(2004) ->
        write('true')
    ;
        write('false')
    ).
      *)
  
  ) bodies)

let string_of_decl (decl:decl) =
  match decl with
  name,args -> ".decl "^ name ^ "(" ^ (expand_args "," (List.map string_of_param args ))  ^ ")"

let string_of_decls li = List.fold_left (fun acc decl -> acc ^ (if acc != "" then "\n" else "") ^ string_of_decl decl ) "" li

let string_of_rules li =  

  List.fold_left (fun acc (head,bodies) -> acc ^ (if acc != "" then "\n\n" else "") ^ 
  (match bodies with
  | [] -> string_of_relation head ^ "."
  | _ -> string_of_relation head ^ " :- " ^ string_of_bodies bodies ^ "." 
  )
  ) "" li

let string_of_facts =  
  List.fold_left ~f:(fun acc (relation) -> acc ^ "\n" ^ string_of_relation relation ^ "." ) ~init:""

let string_of_prolog (prolog:prolog) : string = 
  let (rules) = prolog in 
  (*string_of_decls decls ^ *) string_of_rules rules

let rec string_of_EXECUTE_CMD (cmds:relation list) : string = 
  match cmds with 
  | [] -> "" 
  | cmd :: rest -> "?- " ^ string_of_relation cmd ^ ".\n" ^ string_of_EXECUTE_CMD rest 



let rec string_of_mtl (mtl:mtl) : string = 
  match mtl with 
    Atom propositions -> string_of_relation  propositions
  | Neg mtl' -> "!" ^ string_of_mtl mtl'
  | _ -> "TBD"
  (*| Conj of mtl * mtl 
  | Disj of mtl * mtl 
  | Imply of mtl * mtl 
  | Globally of interval * mtl 
  | Finally  of interval * mtl 
  | Next     of mtl  (* immidiate next state *)
  | Until    of interval * mtl * mtl 
  *)


let rec name4MTL (mtl:mtl) : string = 
  match mtl with 
  | Atom (str, _) -> replace_special_characters str 
  | Finally ((invertal_start, interval_end), mtl') -> 
    let residue = name4MTL mtl' in 
    "finally_" ^ residue ^ "_during_"^ string_of_int invertal_start ^ "_" ^ string_of_int interval_end 
  
  | Next (mtl') -> 
    let residue = name4MTL mtl' in 
    "next_" ^ residue 

  | Globally ((invertal_start, interval_end), mtl') -> 
    let residue = name4MTL mtl' in 
    "globally_" ^ residue ^ "_during_"^ string_of_int invertal_start ^ "_" ^ string_of_int interval_end 

  | Until ((invertal_start, interval_end), mtl1, mtl2) -> 
    let residue1 = name4MTL mtl1 in 
    let residue2 = name4MTL mtl2 in 
    residue1 ^ "_until_" ^ residue2 ^ "_during_"^ string_of_int invertal_start ^ "_" ^ string_of_int interval_end 

  | Neg (mtl') ->   
    let residue = name4MTL mtl' in 
    "neg_" ^ residue 

  | Conj (mtl1, mtl2) ->
    let residue1 = name4MTL mtl1 in 
    let residue2 = name4MTL mtl2 in 
    residue1^ "_AND_" ^ residue2

  | Disj (mtl1, mtl2) ->
    let residue1 = name4MTL mtl1 in 
    let residue2 = name4MTL mtl2 in 
    residue1^ "_OR_" ^ residue2
  
  | Imply (mtl1, mtl2) ->
    let residue1 = name4MTL mtl1 in 
    let residue2 = name4MTL mtl2 in 
    residue1^ "_Imply_" ^ residue2

let get_Start_End_Args arg = 
  match arg with 
  | None -> start_end_args 
  | Some n -> [(Basic (BVAR ("Start"^ string_of_int n)));(Basic (BVAR ("End"^ string_of_int n)))] 


let enumarateAllTheFacts (mtl: mtl) = 
  let name_of_propositions = name4MTL mtl in
  (*let (decl1:decl) = (name_of_propositions, [("year", Number)]) in  *)
  (* RULE1 *)
  let (head:head) = name_of_propositions, [(Basic (BVAR "T"))] in 
  let body = Pos (beginKeyword, 
    [(Basic (BSTR name_of_propositions));Basic ANY;Basic ANY; (Basic (BVAR "T"))]) in 
  let (rule1:rule) = (head, [body]) in 
  (* RULE2 *)
  let (head:head) = name_of_propositions, [(Plus (Basic (BVAR "T_prev"), Basic(BINT 1)))] in 
  let bodies = [
    Pos (name_of_propositions, [Basic (BVAR "T_prev")]); 
    Pos (endKeyword, 
    [(Basic (BSTR name_of_propositions));Basic ANY;Basic ANY; (Basic (BVAR "T1"))]);
    Pure (Lt(Basic (BVAR "T_prev"), Basic (BVAR "T1")))
    ] in 
  let (rule2:rule) = (head, bodies) in 
  name_of_propositions, ([rule1;rule2]) 


(*
compute_negatedIntervals(N, [], Res):- 
    ( N =< 2024 -> Res = [(N, 2024)|[]]; Res = []).

compute_negatedIntervals(N, [(Start, End)|Tail], Res):-
    Start1 is Start-1, 
    End1 is End+1, 
    compute_negatedIntervals(End1, Tail, NegatedIntervals), 
    (N =< Start1 -> Res = [(N, Start1) | NegatedIntervals] ; Res = NegatedIntervals). 
*)
let rulesForComputeNegatedInterval () : rule list = 
  let rule1 = ("compute_negatedintervals", [basic_v "N"; List (Enumarate []); basic_v "Res"]), [
    IfElse (
      LtEq(basic_v"N", basic_n 2024) ,  
      (EqAssign( "Res", List(Enumarate [Tuple([basic_v"N"; basic_n 2024])]))) , 
      (EqAssign( "Res", List(Enumarate []))))
  ] in 
  let rule2 = ("compute_negatedintervals", [basic_v "N"; List(HeadTail(Tuple(start_end_args), basic_v "Tail")); basic_v "Res"]), 
    [
      Assign ("Start1", Minus (basic_v "Start", basic_n 1)); 
      Assign ("End1", Plus (basic_v "End", basic_n 1)); 
      Pos ("compute_negatedintervals", [basic_v "End1"; basic_v "Tail";basic_v "NegatedIntervals"]);
      IfElse (
        LtEq (basic_v "N", basic_v "Start1"), 
        (EqAssign( "Res", List(HeadTail(Tuple([basic_v"N"; basic_v"Start1"]), basic_v "NegatedIntervals")))) , 
        (EqAssign( "Res", basic_v "NegatedIntervals"))
      )
    ] in 
  [rule1;rule2]


let rec mtl2Prolog (mtl:mtl) : (string * prolog) = 
  match mtl with 

(* AP - EXAMPLE 
2000, Atom(iraq_war)
iraq_war(Start, End) :- begin("iraq_war", _,_,Start), end("iraq_war", _,_,End). *) 
  | Atom _ -> 
    let name_of_propositions = name4MTL mtl in
    let (head:head) = name_of_propositions, start_end_args in 
    let body1 = Pos (beginKeyword, 
      [(Basic (BSTR name_of_propositions));Basic ANY;Basic ANY; (Basic (BVAR "Start"))]) in 
    let body2 = Pos (endKeyword, 
      [(Basic (BSTR name_of_propositions));Basic ANY;Basic ANY; (Basic (BVAR "End"))]) in 
    let (rule:rule) = (head, [body1;body2;defaultConstrint]) in 
    name_of_propositions, [rule]
    
(*
% Finally: 1990, Finally([10, 12],iraq_war)
finally_iraq_war_10_12(Start, End):- iraq_war(Start1, End1), Start is Start1-12, End is End1-10. 
*)
  | Finally ((invertal_start, interval_end), mtl') -> 
    let name_inside, (rulesInd) = mtl2Prolog mtl' in 
    let name_outside = name4MTL mtl in

    let head= (name_outside, start_end_args) in 
    let newLowerBound = Minus(basic_v "Start1", basic_n interval_end) in 
    let newUpperBound = Minus(basic_v "End1", basic_n invertal_start) in 

    let bodies = [Pos(name_inside, get_Start_End_Args (Some 1)); 
        Pure (LtEq(newLowerBound, newUpperBound));
        Assign ("Start", newLowerBound); 
        Assign ("End", newUpperBound); 
        defaultConstrint
        ] in 
    let (rule:rule) = (head, bodies) in  
    name_outside, (rulesInd@[rule])

(*
% Next: 1990, Next(iraq_war)
next_iraq_war_10_12(Start, End):- iraq_war(Start1, End1), Start is Start1-1, End is End1-1.
*)
  | Next (mtl') -> 
    let name_inside, (rulesInd) = mtl2Prolog mtl' in 
    let name_outside = name4MTL mtl in

    let head= (name_outside, start_end_args) in 
    let bodies = [Pos(name_inside, get_Start_End_Args (Some 1)); 
        Assign ("Start", Minus(basic_v "Start1", basic_n 1)); 
        Assign ("End", Minus(basic_v "End1", basic_n 1)); 
        defaultConstrint
        ] in 
    let (rule:rule) = (head, bodies) in  
    name_outside, (rulesInd@[rule])

(*
% Globally: 1990, Globally([10, 12],iraq_war)
globally_iraq_war_10_12(Start, End):-iraq_war(Start1, End1), Start1-10=< End1-12, Start is  Start1-10, End is  End1-12. 
*)
  | Globally ((invertal_start, interval_end), mtl') -> 
    let name_inside, (rulesInd) = mtl2Prolog mtl' in 
    let name_outside = name4MTL mtl in

    let head= (name_outside, start_end_args) in 
    let newLowerBound = Minus(basic_v "Start1", basic_n invertal_start) in 
    let newUpperBound = Minus(basic_v "End1", basic_n interval_end) in 
    let bodies = [Pos(name_inside, get_Start_End_Args (Some 1)); 
        Assign ("Start", newLowerBound); 
        Assign ("End", newUpperBound); 
        defaultConstrint
        ] in 
    let (rule:rule) = (head, bodies) in  
    name_outside, (rulesInd@[rule])

(*
% Until
ev1_last_till_10_35(Start, End):- iraq_war(Start1, End1), End1-Start1>=10, Start is Start1+10, End is End1+1. 
 
overlap(Start, End) :-
    ev1_last_till_10_35(Start1, End1),
    ev2(Start2, End2),
    Start is max(Start1, Start2),
    End is min(End1, End2),
    Start < End. 

ev1_until_ev2_10_35(Start, End):- 
    iraq_war(W1, _), 
    overlap(Start1, End1), Start is max(Start1-35, W1), End is End1-10. 
*)
  | Until ((invertal_start, interval_end), mtl1, mtl2) -> 
    let toplevel1, (rulesInd1) = mtl2Prolog mtl1 in 
    let toplevel2, (rulesInd2) = mtl2Prolog mtl2 in 
    let name_outside = name4MTL mtl in 
    let ev1_last_till_helper = toplevel1 ^ "_last_till_" ^ string_of_int invertal_start ^ "_" ^ string_of_int interval_end  in 
    let overlap_helper = name_outside ^ "_overlap" in 


    let head= (ev1_last_till_helper, start_end_args) in 
    let body = [Pos(toplevel1, get_Start_End_Args (Some 1)); 
                Pure (GtEq(Minus(basic_v "End1", basic_v "Start1"), basic_n invertal_start)); 
                Assign ("Start", Plus(basic_v "Start1", basic_n invertal_start));
                Assign ("End", Plus(basic_v "End1", basic_n 1))
                ]  in 
    let (rule_aux1:rule) = (head, body) in  

    let head= (overlap_helper, start_end_args) in 
    let body = [
        Pos(ev1_last_till_helper, get_Start_End_Args (Some 1)); 
        Pos(toplevel2, get_Start_End_Args (Some 2));
        Assign ("Start", TPredicate("max", [basic_v "Start1"; basic_v "Start2"]));
        Assign ("End", TPredicate("min", [basic_v "End1"; basic_v "End2"]));
        Pure (Lt(basic_v "Start", basic_v "End"))
     ]  in 
    let (rule_aux2:rule) = (head, body) in  


    let head= (name_outside, start_end_args) in 
    let body = [
        Pos(toplevel1, [basic_v"W1"; Basic ANY]); 
        Pos(overlap_helper, get_Start_End_Args (Some 1)); 
        Assign ("Start", TPredicate("max", [Minus(basic_v "Start1", basic_n interval_end); basic_v "W1"]));
        Assign ("End", Minus(basic_v "End1", basic_n invertal_start));
        defaultConstrint
     ] in 
    let (rule:rule) = (head, body) in  

    name_outside, (rulesInd1@rulesInd2@[rule_aux1;rule_aux2;rule]) 

(*
% Base case: If the list is empty, do nothing.
generate_facts_iraq_war_and_ev2([]).

% Recursive case: Assert the head of the list and process the tail.
generate_facts_iraq_war_and_ev2([(Start, End) | Tail]) :-
    assert(iraq_war_and_ev2(Start, End)),  % Assert the current head as a fact.
    generate_facts_iraq_war_and_ev2(Tail).  % Recursively call for the tail.

iraq_war_and_ev2_aux():- 
    findall((S,E), iraq_war(S,E), Interval1), 
    findall((S,E), ev2(S,E), Interval2), 
    overlap_two_li(Interval1, Interval2, Interval), 
    generate_facts_iraq_war_and_ev2(Interval).
*)

  | Conj (mtl1, mtl2) -> 
    let toplevel1, (rulesInd1) = mtl2Prolog mtl1 in 
    let toplevel2, (rulesInd2) = mtl2Prolog mtl2 in 
    let name_outside = name4MTL mtl in 

    let generate_facts_Name = "generate_facts_" ^ name_outside  in 
    let generate_facts_Rule1 = (generate_facts_Name, [List(Enumarate [])]), [Pos ("assert", [TPredicate(name_outside, [basic_n (-1); basic_n (-1)])])] in 
    let generate_facts_Rule2 = (generate_facts_Name, [List(HeadTail (Tuple(start_end_args), basic_v "Tail"))]), 
      [
      Pos ("assert", [TPredicate(name_outside, start_end_args)]);
      Pos (generate_facts_Name, [basic_v "Tail"])
      ] 
    in 

    let name_outside_aux = name_outside ^ "_aux" in 
    let (name_outside_aux_rule:rule) = (name_outside_aux, []), 
      [Pos("findall", [Tuple(start_end_args);TPredicate(toplevel1, start_end_args);basic_v"Interval1"]);
       Pos("findall", [Tuple(start_end_args);TPredicate(toplevel2, start_end_args);basic_v"Interval2"]);
       Pos("overlap_two_li", [basic_v"Interval1"; basic_v "Interval2"; basic_v "Interval"]);
       Pos(generate_facts_Name, [basic_v "Interval"])
      ] 
    in  
    executeCMD := !executeCMD@ [(name_outside_aux, [])]; 

    name_outside, (rulesInd1@rulesInd2@[generate_facts_Rule1;generate_facts_Rule2; name_outside_aux_rule]) 



(*
% Disjunction 

generate_facts_iraq_war_or_ev2([]).

generate_facts_iraq_war_or_ev2([(Start, End) | Tail]) :-
    assert(iraq_war_or_ev2(Start, End)),  % Assert the current head as a fact.
    generate_facts_iraq_war_or_ev2(Tail).  % Recursively call for the tail.

iraq_war_or_ev2_aux():- 
    findall((S,E), iraq_war(S,E), Interval1), 
    findall((S,E), ev2(S,E), Interval2), 
    append1(Interval1, Interval2, Interval), 
    generate_facts_iraq_war_or_ev2(Interval).

?- iraq_war_or_ev2_aux().
*)
  | Disj (mtl1, mtl2) -> 

    let toplevel1, (rulesInd1) = mtl2Prolog mtl1 in 
    let toplevel2, (rulesInd2) = mtl2Prolog mtl2 in 
    let name_outside = name4MTL mtl in 

    let generate_facts_Name = "generate_facts_" ^ name_outside  in 
    let generate_facts_Rule1 = (generate_facts_Name, [List(Enumarate [])]), [Pos ("assert", [TPredicate(name_outside, [basic_n (-1); basic_n (-1)])])] in 
    let generate_facts_Rule2 = (generate_facts_Name, [List(HeadTail (Tuple(start_end_args), basic_v "Tail"))]), 
      [
      Pos ("assert", [TPredicate(name_outside, start_end_args)]);
      Pos (generate_facts_Name, [basic_v "Tail"])
      ] 
    in 

    let name_outside_aux = name_outside ^ "_aux" in 
    let (name_outside_aux_rule:rule) = (name_outside_aux, []), 
      [Pos("findall", [Tuple(start_end_args);TPredicate(toplevel1, start_end_args);basic_v"Interval1"]);
       Pos("findall", [Tuple(start_end_args);TPredicate(toplevel2, start_end_args);basic_v"Interval2"]);
       Pos("append1", [basic_v"Interval1"; basic_v "Interval2"; basic_v "Interval"]);
       Pos(generate_facts_Name, [basic_v "Interval"])
      ] 
    in  
    executeCMD := !executeCMD@ [(name_outside_aux, [])]; 

    name_outside, (rulesInd1@rulesInd2@[generate_facts_Rule1;generate_facts_Rule2; name_outside_aux_rule]) 



(*
% Base case: If the list is empty, do nothing.
generate_facts([]).

% Recursive case: Assert the head of the list and process the tail.
generate_facts([(Start, End) | Tail]) :-
    assert(neg_interval(Start, End)),  % Assert the current head as a fact.
    generate_facts(Tail).  % Recursively call for the tail.

% Sort intervals using the comparator
sort_intervals(SortedIntervals) :-
    findall((S,E), interval(S,E), UnsortedIntervals), 
    predsort(compare_intervals, UnsortedIntervals, SortedIntervals).

geenrate_neg_interval():- 
    sort_intervals(SortedIntervals), 
    compute_negatedIntervals(0, SortedIntervals, NegatedIntervals), 
    generate_facts(NegatedIntervals).

?- geenrate_neg_interval().

% Comparator to sort intervals based on their starting point
compare_intervals(Dir, interval(Start1, _), interval(Start2, _)) :-
    ( Start1 =< Start2 -> Dir = '<' ; Dir = '>' ).

*)
  | Neg mtl' ->
    let name_inside, rulesInd1 = mtl2Prolog mtl' in
    let name_outside = name4MTL mtl in

    let compareMTL_inside = "compare_" ^ name_inside in 
    let (compareMTL_Rule: rule) = (compareMTL_inside, [basic_v "Dir"; TPredicate(name_inside, [basic_v "Start1"; Basic ANY]);TPredicate(name_inside, [basic_v "Start2"; Basic ANY])]), 
    [
    Pure(LtEq(basic_v "Start1",basic_v "Start2"))
    ] in 

    let generateNegFacts = "generate_"^ name_outside in 
    let (generateNegFacts_RULE1:rule) = (generateNegFacts, [(List (Enumarate []))]), [] in 
    let (generateNegFacts_RULE2:rule) = (generateNegFacts, [(List (HeadTail ((Tuple [basic_v "Start"; basic_v "End"]), basic_v "Tail")))]), 
      [
        Pos("assert", [TPredicate(name_outside, start_end_args)]);
        Pos(generateNegFacts, [basic_v"Tail"])
      ] 
    in 
    let sortingRuleName = "sort_"^ name_inside in 
    let (sortingRule:rule) = (sortingRuleName, [basic_v"SortedIntervals"]), 
    [Pos("findall", [Tuple(start_end_args);TPredicate(name_inside, start_end_args);basic_v"UnsortedIntervals"]);
     Pos("predsort", [basic_v ("compare_" ^ name_inside); basic_v "UnsortedIntervals"; basic_v "SortedIntervals"])
    ] 
    in 

    let generate_NEG_rule_name = generateNegFacts ^ "_aux" in 
    let (generate_NEG_rule_aux:rule) = (generate_NEG_rule_name, []), 
      [Pos(sortingRuleName, [basic_v"SortedIntervals"]);
       Pos("compute_negatedintervals", [basic_n 0; basic_v "SortedIntervals"; basic_v "NegatedIntervals"]);
       Pos(generateNegFacts, [basic_v "NegatedIntervals"])
      ] 
    in 
    executeCMD := !executeCMD@ [(generate_NEG_rule_name, [])]; 
    let basic_rules = rulesInd1@[compareMTL_Rule;generateNegFacts_RULE1;generateNegFacts_RULE2;sortingRule;generate_NEG_rule_aux] in 
    (*let finalRules = 
      match !computeNegatedInterval with 
      | true -> basic_rules
      | false -> 
        computeNegatedInterval := true; 
        basic_rules @ (rulesForComputeNegatedInterval ()) 
    in 
    *)
    name_outside, basic_rules



  | Imply (mtl1, mtl2) -> mtl2Prolog (Disj(Neg mtl1, mtl2))
      



let generateTheQueryRule name_of_propositions query_time : (string * prolog) = 

    let name_of_propositions_at:string = (name_of_propositions^ "_at_" ^ string_of_int query_time) in  
    let (rule1:rule) = (name_of_propositions_at, [basic_v "Res"]), 
    [
      Pos("setof", [Tuple(start_end_args); TPredicate(name_of_propositions, start_end_args); basic_v "AllINtervals"]);
      Pos("checkvalidity", [basic_n query_time; basic_v "AllINtervals"; basic_v "Res"])  
    ]
    in 
    let (rule2:rule) = ((check_queryKeyword, []), 
    [
     Pos ("write", [Basic(BSTR ("Query = " ^ name_of_propositions_at))])
    ;IfElse(Predicate(name_of_propositions_at, [basic_v "true"]), Pos ("write", [Basic(BSTR "\\nRes   = true")]), Pos ("write", [Basic(BSTR "\\nRes   = false")]))] )
    in 
    name_of_propositions_at, ([rule1; rule2])

          (*

neg_iraq_war_at_2051(Res) :- 
    setof((Start,End), neg_iraq_war(Start,End), AllINtervals), 
    checkValidity(2022, AllINtervals, Res). 
    
check_query() :- write('Query = neg_iraq_war_at_2051'), (neg_iraq_war_at_2051(true) -> write('\nRes   = true');write('\nRes   = false')).
      *)
      
let ordinal_suffix (n: int) : string =
  let last_digit = n mod 10 in
  let last_two_digits = n mod 100 in
  if last_two_digits >= 11 && last_two_digits <= 13 then
    string_of_int n ^ "th"
  else
    match last_digit with
    | 1 -> string_of_int n ^ "st"
    | 2 -> string_of_int n ^ "nd"
    | 3 -> string_of_int n ^ "rd"
    | _ -> string_of_int n ^ "th"

let mtl2NL (mtl:mtl) (queryT:int) : string = 
  let rec mtl2NL_aux (mtl': mtl) (index: int): string = 
    match mtl' with 
    | Atom (name, _) -> name ^ " happen"  (* 使用原始名称 *)

    | Finally ((invertal_start, interval_end), mtl1) -> 
      let residue = eventKeyword ^ string_of_int index in 
      let nextEvent = (mtl2NL_aux mtl1 (index +1)) in 
      residue ^ " finally happen within the time frame of the " ^ 
      ordinal_suffix invertal_start ^ " to the " ^ ordinal_suffix interval_end ^ 
      " after the year " ^ string_of_int queryT ^ " onwards; where " ^ residue 
      ^ " is " ^ nextEvent

    | Globally ((invertal_start, interval_end), mtl1) -> 
      let residue = eventKeyword ^ string_of_int index in 
      let nextEvent = (mtl2NL_aux mtl1 (index +1)) in 
      residue ^ " globally happen within the time frame of the " ^ 
      ordinal_suffix invertal_start ^ " to the " ^ ordinal_suffix interval_end ^ 
      " after the year " ^ string_of_int queryT ^ " onwards; where " ^ residue 
      ^ " is " ^ nextEvent

    | Next (mtl1) -> 
      let residue = eventKeyword ^ string_of_int index in 
      let nextEvent = (mtl2NL_aux mtl1 (index +1)) in 
      residue ^ " happen in the next year; where " ^ residue 
      ^ " is " ^ nextEvent

    | Until ((interval_start, interval_end), mtl1, mtl2) -> 
      let residue1 = eventKeyword ^ string_of_int index in 
      let residue2 = eventKeyword ^ string_of_int (index + 1) in 
      let nextEvent1 = (mtl2NL_aux mtl1 (index + 1)) in 
      let nextEvent2 = (mtl2NL_aux mtl2 (index + 2)) in 
      residue1 ^ " happen continuously until " ^ residue2 ^ " started, during the period from the " ^ 
      ordinal_suffix interval_start ^ " to the " ^ ordinal_suffix interval_end ^ 
      " after the year " ^ string_of_int queryT ^ " onwards; where " ^ residue1 ^ 
      " is " ^ nextEvent1 ^ " and " ^ residue2 ^ " is " ^ nextEvent2

    | Conj (mtl1, mtl2) ->  
      let residue1 = eventKeyword ^ string_of_int index in 
      let residue2 = eventKeyword ^ string_of_int (index + 1) in 
      let nextEvent1 = (mtl2NL_aux mtl1 (index +10)) in 
      let nextEvent2 = (mtl2NL_aux mtl2 (index +20)) in 
      residue1 ^ " happen and " ^ residue2 ^ " also happen; where " ^ 
      residue1 ^ " is " ^ nextEvent1 ^ " and " ^ 
      residue2 ^ " is " ^ nextEvent2 

    | Disj (mtl1, mtl2) ->  
      let residue1 = eventKeyword ^ string_of_int index in 
      let residue2 = eventKeyword ^ string_of_int (index + 1) in 
      let nextEvent1 = (mtl2NL_aux mtl1 (index +10)) in 
      let nextEvent2 = (mtl2NL_aux mtl2 (index +20)) in 
      residue1 ^ " happen or " ^ residue2 ^ " happen; where " ^ 
      residue1 ^ " is " ^ nextEvent1 ^ " and " ^ 
      residue2 ^ " is " ^ nextEvent2 

    | Neg mtl1 -> 
      let residue = eventKeyword ^ string_of_int index in 
      let nextEvent = (mtl2NL_aux mtl1 (index +1)) in 
      residue ^ " not happen; where " ^ residue 
      ^ " is " ^ nextEvent

    | Imply (mtl1, mtl2) -> 
      mtl2NL_aux (Disj (Neg mtl1, mtl2)) index
  in 

  (* 判断是否需要 `At year` 的前缀 *)
  match mtl with 
  | Atom _ | Conj _ | Disj _ | Neg _ | Imply _ -> 
      "At year " ^ string_of_int queryT ^ ", did " ^ mtl2NL_aux mtl 1 ^ "?"
  | Finally _ | Globally _ | Until _ -> 
      "Did " ^ mtl2NL_aux mtl 1 ^ "?"
  | Next _ -> 
      "At year " ^ string_of_int queryT ^ ", did " ^ mtl2NL_aux mtl 1 ^ "?"
