open Ast_utility
open Parser
open Lexer
open Unix
  

let run_prolog_command command =
  let ic = Unix.open_process_in command in
  let rec read_output acc =
    try
      let line = input_line ic in
      read_output (acc ^ line ^ "\n")
    with End_of_file -> acc
  in
  let output = read_output "" in
  ignore (Unix.close_process_in ic);
  output
;;

let write_and_print oc str =
  (* 将字符串打印到控制台 *)
  print_endline str;
  (* 将字符串写入文件 *)
  Printf.fprintf oc "%s\n" str;
  flush oc
;;

let write_lines filename lines =
  let oc = open_out ("generated/" ^ filename) in
  List.iter (fun line -> Printf.fprintf oc "%s\n" line) lines;
  close_out oc
;;

let syhtrim str =
  if String.compare str "" == 0 then "" else
  let search_pos init p next =
    let rec search i =
      if p i then raise(Failure "empty") else
      match str.[i] with
      | ' ' | '\n' | '\r' | '\t' -> search (next i)
      | _ -> i
    in
    search init
  in
  let len = String.length str in
  try
    let left = search_pos 0 (fun i -> i >= len) (succ)
    and right = search_pos (len - 1) (fun i -> i < 0) (pred)
    in
    String.sub str left (right - left + 1)
  with
  | Failure "empty" -> ""
;;

let rec input_lines file =
  match try [input_line file] with End_of_file -> [] with
   [] -> []
  | [line] -> (syhtrim line) :: input_lines file
  | _ -> assert false 
;;


let retriveQueries (source:string) : ((Ast_utility.mtl * int) list ) = 
  let ic = open_in source in
  try
      let lines =  (input_lines ic ) in
      let rec helper (li:string list) = 
        match li with 
        | [] -> ""
        | x :: xs -> x ^ "\n" ^ helper xs 
      in 
      let line = helper lines in
      print_endline (line);

      let user_sepcifications = Parser.mtlQueries Lexer.token (Lexing.from_string line)  in 
        
        

      close_in ic ;                 (* 关闭输入通道 *)
      (user_sepcifications)

      (*
            flush stdin;                (* 现在写入默认设备 *)
      print_string (List.fold_left (fun acc a -> acc ^ forward_verification a progs) "" progs ) ; 
      *)

    with e ->                      (* 一些不可预见的异常发生 *)
      close_in_noerr ic;           (* 紧急关闭 *)
      raise e                      (* 以出错的形式退出: 文件已关闭,但通道没有写入东西 *)

   ;;

let main = 
  let oc = open_out "output.txt" in
  print_endline ("Welcome to NL2LTL2QA!");
  let inputMTLQueries = retriveQueries ("queries.txt") in 
  List.iter (fun (mtl, queryTime) -> 
      executeCMD := []; 
      let prolog = mtl2Prolog mtl in 
      let toplevelName, rules = prolog in 
      let toplevelName', rule1 = generateTheQueryRule toplevelName queryTime in 
      let prolog' = (rules@rule1) in 
      let out0 = ":- include('database.pl')." in 
      let out1 = string_of_prolog (prolog') in 
      (*let out2 = ".output "^ query ^  "(IO=stdout)\n.output "^ beginKeyword ^"(IO=stdout)\n.output " ^ endKeyword ^"(IO=stdout)" in *)
      let out2 = string_of_EXECUTE_CMD(!executeCMD) in 


      write_lines (toplevelName' ^ ".pl") 
      ([out0;out1;out2]);
    
    
      write_and_print oc (Ast_utility.mtl2NL mtl queryTime);
      (*let command = "souffle -F. -D. " ^ query ^ ".dl" in *)
      let my_query = check_queryKeyword ^ "()" in 
      let command = "swipl -q -t \"consult(\'generated/" ^ toplevelName' ^ ".pl\'), " ^ my_query^ ", nl, halt.\" 2>/dev/null " in 


      (* print_endline ("<==\n Runing Datalog $ " ^ command  ^ " \n==>"); *)
      print_endline ("<=========>\nRunning Prolog $ " ^ command  ^ "");
      let result = run_prolog_command command in
      write_and_print oc result;
    
  ) inputMTLQueries (*mtlGeneratorTests *);
  (* 关闭文件 *)
  close_out oc
;;