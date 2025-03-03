:- include('database.pl').
battle_of_l_tzen(Start,End) :- begin('battle_of_l_tzen',_,_,Start), end('battle_of_l_tzen',_,_,End), Start=<End.

smallville(Start,End) :- begin('smallville',_,_,Start), end('smallville',_,_,End), Start=<End.

generate_facts_battle_of_l_tzen_OR_smallville([]) :- assert(battle_of_l_tzen_OR_smallville(-1,-1)).

generate_facts_battle_of_l_tzen_OR_smallville([(Start,End) | Tail]) :- assert(battle_of_l_tzen_OR_smallville(Start,End)), generate_facts_battle_of_l_tzen_OR_smallville(Tail).

battle_of_l_tzen_OR_smallville_aux() :- findall((Start,End),battle_of_l_tzen(Start,End),Interval1), findall((Start,End),smallville(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_l_tzen_OR_smallville(Interval).

battle_of_l_tzen_OR_smallville_at_1886(Res) :- setof((Start,End),battle_of_l_tzen_OR_smallville(Start,End),AllINtervals), checkvalidity(1886,AllINtervals,Res).

check_query() :- write('Query = battle_of_l_tzen_OR_smallville_at_1886'), (battle_of_l_tzen_OR_smallville_at_1886(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_l_tzen_OR_smallville_aux().

