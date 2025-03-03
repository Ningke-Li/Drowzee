:- include('database.pl').
code_lyoko(Start,End) :- begin('code_lyoko',_,_,Start), end('code_lyoko',_,_,End), Start=<End.

battle_of_kiev(Start,End) :- begin('battle_of_kiev',_,_,Start), end('battle_of_kiev',_,_,End), Start=<End.

generate_facts_code_lyoko_OR_battle_of_kiev([]) :- assert(code_lyoko_OR_battle_of_kiev(-1,-1)).

generate_facts_code_lyoko_OR_battle_of_kiev([(Start,End) | Tail]) :- assert(code_lyoko_OR_battle_of_kiev(Start,End)), generate_facts_code_lyoko_OR_battle_of_kiev(Tail).

code_lyoko_OR_battle_of_kiev_aux() :- findall((Start,End),code_lyoko(Start,End),Interval1), findall((Start,End),battle_of_kiev(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_code_lyoko_OR_battle_of_kiev(Interval).

code_lyoko_OR_battle_of_kiev_at_2005(Res) :- setof((Start,End),code_lyoko_OR_battle_of_kiev(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = code_lyoko_OR_battle_of_kiev_at_2005'), (code_lyoko_OR_battle_of_kiev_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- code_lyoko_OR_battle_of_kiev_aux().

