:- include('database.pl').
ev_1936_soviet_constitution(Start,End) :- begin('ev_1936_soviet_constitution',_,_,Start), end('ev_1936_soviet_constitution',_,_,End), Start=<End.

battle_of_kursk(Start,End) :- begin('battle_of_kursk',_,_,Start), end('battle_of_kursk',_,_,End), Start=<End.

generate_facts_ev_1936_soviet_constitution_OR_battle_of_kursk([]) :- assert(ev_1936_soviet_constitution_OR_battle_of_kursk(-1,-1)).

generate_facts_ev_1936_soviet_constitution_OR_battle_of_kursk([(Start,End) | Tail]) :- assert(ev_1936_soviet_constitution_OR_battle_of_kursk(Start,End)), generate_facts_ev_1936_soviet_constitution_OR_battle_of_kursk(Tail).

ev_1936_soviet_constitution_OR_battle_of_kursk_aux() :- findall((Start,End),ev_1936_soviet_constitution(Start,End),Interval1), findall((Start,End),battle_of_kursk(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1936_soviet_constitution_OR_battle_of_kursk(Interval).

ev_1936_soviet_constitution_OR_battle_of_kursk_at_1963(Res) :- setof((Start,End),ev_1936_soviet_constitution_OR_battle_of_kursk(Start,End),AllINtervals), checkvalidity(1963,AllINtervals,Res).

check_query() :- write('Query = ev_1936_soviet_constitution_OR_battle_of_kursk_at_1963'), (ev_1936_soviet_constitution_OR_battle_of_kursk_at_1963(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1936_soviet_constitution_OR_battle_of_kursk_aux().

