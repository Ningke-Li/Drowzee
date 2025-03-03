:- include('database.pl').
first_battle_of_kharkov(Start,End) :- begin('first_battle_of_kharkov',_,_,Start), end('first_battle_of_kharkov',_,_,End), Start=<End.

xinhai_revolution(Start,End) :- begin('xinhai_revolution',_,_,Start), end('xinhai_revolution',_,_,End), Start=<End.

generate_facts_first_battle_of_kharkov_OR_xinhai_revolution([]) :- assert(first_battle_of_kharkov_OR_xinhai_revolution(-1,-1)).

generate_facts_first_battle_of_kharkov_OR_xinhai_revolution([(Start,End) | Tail]) :- assert(first_battle_of_kharkov_OR_xinhai_revolution(Start,End)), generate_facts_first_battle_of_kharkov_OR_xinhai_revolution(Tail).

first_battle_of_kharkov_OR_xinhai_revolution_aux() :- findall((Start,End),first_battle_of_kharkov(Start,End),Interval1), findall((Start,End),xinhai_revolution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_first_battle_of_kharkov_OR_xinhai_revolution(Interval).

first_battle_of_kharkov_OR_xinhai_revolution_at_1914(Res) :- setof((Start,End),first_battle_of_kharkov_OR_xinhai_revolution(Start,End),AllINtervals), checkvalidity(1914,AllINtervals,Res).

check_query() :- write('Query = first_battle_of_kharkov_OR_xinhai_revolution_at_1914'), (first_battle_of_kharkov_OR_xinhai_revolution_at_1914(true) -> write('\nRes   = true');write('\nRes   = false')).
?- first_battle_of_kharkov_OR_xinhai_revolution_aux().

