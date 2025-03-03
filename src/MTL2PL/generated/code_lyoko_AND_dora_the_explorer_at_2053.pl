:- include('database.pl').
code_lyoko(Start,End) :- begin('code_lyoko',_,_,Start), end('code_lyoko',_,_,End), Start=<End.

dora_the_explorer(Start,End) :- begin('dora_the_explorer',_,_,Start), end('dora_the_explorer',_,_,End), Start=<End.

generate_facts_code_lyoko_AND_dora_the_explorer([]) :- assert(code_lyoko_AND_dora_the_explorer(-1,-1)).

generate_facts_code_lyoko_AND_dora_the_explorer([(Start,End) | Tail]) :- assert(code_lyoko_AND_dora_the_explorer(Start,End)), generate_facts_code_lyoko_AND_dora_the_explorer(Tail).

code_lyoko_AND_dora_the_explorer_aux() :- findall((Start,End),code_lyoko(Start,End),Interval1), findall((Start,End),dora_the_explorer(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_code_lyoko_AND_dora_the_explorer(Interval).

code_lyoko_AND_dora_the_explorer_at_2053(Res) :- setof((Start,End),code_lyoko_AND_dora_the_explorer(Start,End),AllINtervals), checkvalidity(2053,AllINtervals,Res).

check_query() :- write('Query = code_lyoko_AND_dora_the_explorer_at_2053'), (code_lyoko_AND_dora_the_explorer_at_2053(true) -> write('\nRes   = true');write('\nRes   = false')).
?- code_lyoko_AND_dora_the_explorer_aux().

