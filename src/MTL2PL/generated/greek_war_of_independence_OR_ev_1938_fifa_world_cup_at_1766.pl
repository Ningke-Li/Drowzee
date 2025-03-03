:- include('database.pl').
greek_war_of_independence(Start,End) :- begin('greek_war_of_independence',_,_,Start), end('greek_war_of_independence',_,_,End), Start=<End.

ev_1938_fifa_world_cup(Start,End) :- begin('ev_1938_fifa_world_cup',_,_,Start), end('ev_1938_fifa_world_cup',_,_,End), Start=<End.

generate_facts_greek_war_of_independence_OR_ev_1938_fifa_world_cup([]) :- assert(greek_war_of_independence_OR_ev_1938_fifa_world_cup(-1,-1)).

generate_facts_greek_war_of_independence_OR_ev_1938_fifa_world_cup([(Start,End) | Tail]) :- assert(greek_war_of_independence_OR_ev_1938_fifa_world_cup(Start,End)), generate_facts_greek_war_of_independence_OR_ev_1938_fifa_world_cup(Tail).

greek_war_of_independence_OR_ev_1938_fifa_world_cup_aux() :- findall((Start,End),greek_war_of_independence(Start,End),Interval1), findall((Start,End),ev_1938_fifa_world_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_greek_war_of_independence_OR_ev_1938_fifa_world_cup(Interval).

greek_war_of_independence_OR_ev_1938_fifa_world_cup_at_1766(Res) :- setof((Start,End),greek_war_of_independence_OR_ev_1938_fifa_world_cup(Start,End),AllINtervals), checkvalidity(1766,AllINtervals,Res).

check_query() :- write('Query = greek_war_of_independence_OR_ev_1938_fifa_world_cup_at_1766'), (greek_war_of_independence_OR_ev_1938_fifa_world_cup_at_1766(true) -> write('\nRes   = true');write('\nRes   = false')).
?- greek_war_of_independence_OR_ev_1938_fifa_world_cup_aux().

