:- include('database.pl').
w(Start,End) :- begin('w',_,_,Start), end('w',_,_,End), Start=<End.

world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

generate_facts_w_OR_world_war_ii_in_yugoslavia([]) :- assert(w_OR_world_war_ii_in_yugoslavia(-1,-1)).

generate_facts_w_OR_world_war_ii_in_yugoslavia([(Start,End) | Tail]) :- assert(w_OR_world_war_ii_in_yugoslavia(Start,End)), generate_facts_w_OR_world_war_ii_in_yugoslavia(Tail).

w_OR_world_war_ii_in_yugoslavia_aux() :- findall((Start,End),w(Start,End),Interval1), findall((Start,End),world_war_ii_in_yugoslavia(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_w_OR_world_war_ii_in_yugoslavia(Interval).

w_OR_world_war_ii_in_yugoslavia_at_1945(Res) :- setof((Start,End),w_OR_world_war_ii_in_yugoslavia(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = w_OR_world_war_ii_in_yugoslavia_at_1945'), (w_OR_world_war_ii_in_yugoslavia_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).
?- w_OR_world_war_ii_in_yugoslavia_aux().

