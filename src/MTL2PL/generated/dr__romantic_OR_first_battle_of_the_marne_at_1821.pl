:- include('database.pl').
dr__romantic(Start,End) :- begin('dr__romantic',_,_,Start), end('dr__romantic',_,_,End), Start=<End.

first_battle_of_the_marne(Start,End) :- begin('first_battle_of_the_marne',_,_,Start), end('first_battle_of_the_marne',_,_,End), Start=<End.

generate_facts_dr__romantic_OR_first_battle_of_the_marne([]) :- assert(dr__romantic_OR_first_battle_of_the_marne(-1,-1)).

generate_facts_dr__romantic_OR_first_battle_of_the_marne([(Start,End) | Tail]) :- assert(dr__romantic_OR_first_battle_of_the_marne(Start,End)), generate_facts_dr__romantic_OR_first_battle_of_the_marne(Tail).

dr__romantic_OR_first_battle_of_the_marne_aux() :- findall((Start,End),dr__romantic(Start,End),Interval1), findall((Start,End),first_battle_of_the_marne(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_dr__romantic_OR_first_battle_of_the_marne(Interval).

dr__romantic_OR_first_battle_of_the_marne_at_1821(Res) :- setof((Start,End),dr__romantic_OR_first_battle_of_the_marne(Start,End),AllINtervals), checkvalidity(1821,AllINtervals,Res).

check_query() :- write('Query = dr__romantic_OR_first_battle_of_the_marne_at_1821'), (dr__romantic_OR_first_battle_of_the_marne_at_1821(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dr__romantic_OR_first_battle_of_the_marne_aux().

