:- include('database.pl').
anglo_soviet_invasion_of_iran(Start,End) :- begin('anglo_soviet_invasion_of_iran',_,_,Start), end('anglo_soviet_invasion_of_iran',_,_,End), Start=<End.

ev_2015_rugby_world_cup(Start,End) :- begin('ev_2015_rugby_world_cup',_,_,Start), end('ev_2015_rugby_world_cup',_,_,End), Start=<End.

generate_facts_anglo_soviet_invasion_of_iran_OR_ev_2015_rugby_world_cup([]) :- assert(anglo_soviet_invasion_of_iran_OR_ev_2015_rugby_world_cup(-1,-1)).

generate_facts_anglo_soviet_invasion_of_iran_OR_ev_2015_rugby_world_cup([(Start,End) | Tail]) :- assert(anglo_soviet_invasion_of_iran_OR_ev_2015_rugby_world_cup(Start,End)), generate_facts_anglo_soviet_invasion_of_iran_OR_ev_2015_rugby_world_cup(Tail).

anglo_soviet_invasion_of_iran_OR_ev_2015_rugby_world_cup_aux() :- findall((Start,End),anglo_soviet_invasion_of_iran(Start,End),Interval1), findall((Start,End),ev_2015_rugby_world_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_anglo_soviet_invasion_of_iran_OR_ev_2015_rugby_world_cup(Interval).

anglo_soviet_invasion_of_iran_OR_ev_2015_rugby_world_cup_at_1968(Res) :- setof((Start,End),anglo_soviet_invasion_of_iran_OR_ev_2015_rugby_world_cup(Start,End),AllINtervals), checkvalidity(1968,AllINtervals,Res).

check_query() :- write('Query = anglo_soviet_invasion_of_iran_OR_ev_2015_rugby_world_cup_at_1968'), (anglo_soviet_invasion_of_iran_OR_ev_2015_rugby_world_cup_at_1968(true) -> write('\nRes   = true');write('\nRes   = false')).
?- anglo_soviet_invasion_of_iran_OR_ev_2015_rugby_world_cup_aux().

