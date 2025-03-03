:- include('database.pl').
second_battle_of_the_marne(Start,End) :- begin('second_battle_of_the_marne',_,_,Start), end('second_battle_of_the_marne',_,_,End), Start=<End.

ev_1908_summer_olympics(Start,End) :- begin('ev_1908_summer_olympics',_,_,Start), end('ev_1908_summer_olympics',_,_,End), Start=<End.

generate_facts_second_battle_of_the_marne_OR_ev_1908_summer_olympics([]) :- assert(second_battle_of_the_marne_OR_ev_1908_summer_olympics(-1,-1)).

generate_facts_second_battle_of_the_marne_OR_ev_1908_summer_olympics([(Start,End) | Tail]) :- assert(second_battle_of_the_marne_OR_ev_1908_summer_olympics(Start,End)), generate_facts_second_battle_of_the_marne_OR_ev_1908_summer_olympics(Tail).

second_battle_of_the_marne_OR_ev_1908_summer_olympics_aux() :- findall((Start,End),second_battle_of_the_marne(Start,End),Interval1), findall((Start,End),ev_1908_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_second_battle_of_the_marne_OR_ev_1908_summer_olympics(Interval).

second_battle_of_the_marne_OR_ev_1908_summer_olympics_at_1908(Res) :- setof((Start,End),second_battle_of_the_marne_OR_ev_1908_summer_olympics(Start,End),AllINtervals), checkvalidity(1908,AllINtervals,Res).

check_query() :- write('Query = second_battle_of_the_marne_OR_ev_1908_summer_olympics_at_1908'), (second_battle_of_the_marne_OR_ev_1908_summer_olympics_at_1908(true) -> write('\nRes   = true');write('\nRes   = false')).
?- second_battle_of_the_marne_OR_ev_1908_summer_olympics_aux().

