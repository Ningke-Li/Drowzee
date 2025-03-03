:- include('database.pl').
winter_war(Start,End) :- begin('winter_war',_,_,Start), end('winter_war',_,_,End), Start=<End.

ev_2001_world_championships_in_athletics(Start,End) :- begin('ev_2001_world_championships_in_athletics',_,_,Start), end('ev_2001_world_championships_in_athletics',_,_,End), Start=<End.

generate_facts_winter_war_OR_ev_2001_world_championships_in_athletics([]) :- assert(winter_war_OR_ev_2001_world_championships_in_athletics(-1,-1)).

generate_facts_winter_war_OR_ev_2001_world_championships_in_athletics([(Start,End) | Tail]) :- assert(winter_war_OR_ev_2001_world_championships_in_athletics(Start,End)), generate_facts_winter_war_OR_ev_2001_world_championships_in_athletics(Tail).

winter_war_OR_ev_2001_world_championships_in_athletics_aux() :- findall((Start,End),winter_war(Start,End),Interval1), findall((Start,End),ev_2001_world_championships_in_athletics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_winter_war_OR_ev_2001_world_championships_in_athletics(Interval).

winter_war_OR_ev_2001_world_championships_in_athletics_at_1840(Res) :- setof((Start,End),winter_war_OR_ev_2001_world_championships_in_athletics(Start,End),AllINtervals), checkvalidity(1840,AllINtervals,Res).

check_query() :- write('Query = winter_war_OR_ev_2001_world_championships_in_athletics_at_1840'), (winter_war_OR_ev_2001_world_championships_in_athletics_at_1840(true) -> write('\nRes   = true');write('\nRes   = false')).
?- winter_war_OR_ev_2001_world_championships_in_athletics_aux().

