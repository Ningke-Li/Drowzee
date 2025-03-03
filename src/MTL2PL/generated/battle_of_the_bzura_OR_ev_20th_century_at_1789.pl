:- include('database.pl').
battle_of_the_bzura(Start,End) :- begin('battle_of_the_bzura',_,_,Start), end('battle_of_the_bzura',_,_,End), Start=<End.

ev_20th_century(Start,End) :- begin('ev_20th_century',_,_,Start), end('ev_20th_century',_,_,End), Start=<End.

generate_facts_battle_of_the_bzura_OR_ev_20th_century([]) :- assert(battle_of_the_bzura_OR_ev_20th_century(-1,-1)).

generate_facts_battle_of_the_bzura_OR_ev_20th_century([(Start,End) | Tail]) :- assert(battle_of_the_bzura_OR_ev_20th_century(Start,End)), generate_facts_battle_of_the_bzura_OR_ev_20th_century(Tail).

battle_of_the_bzura_OR_ev_20th_century_aux() :- findall((Start,End),battle_of_the_bzura(Start,End),Interval1), findall((Start,End),ev_20th_century(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_the_bzura_OR_ev_20th_century(Interval).

battle_of_the_bzura_OR_ev_20th_century_at_1789(Res) :- setof((Start,End),battle_of_the_bzura_OR_ev_20th_century(Start,End),AllINtervals), checkvalidity(1789,AllINtervals,Res).

check_query() :- write('Query = battle_of_the_bzura_OR_ev_20th_century_at_1789'), (battle_of_the_bzura_OR_ev_20th_century_at_1789(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_the_bzura_OR_ev_20th_century_aux().

