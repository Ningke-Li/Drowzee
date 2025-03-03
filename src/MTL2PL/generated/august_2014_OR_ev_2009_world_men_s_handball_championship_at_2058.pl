:- include('database.pl').
august_2014(Start,End) :- begin('august_2014',_,_,Start), end('august_2014',_,_,End), Start=<End.

ev_2009_world_men_s_handball_championship(Start,End) :- begin('ev_2009_world_men_s_handball_championship',_,_,Start), end('ev_2009_world_men_s_handball_championship',_,_,End), Start=<End.

generate_facts_august_2014_OR_ev_2009_world_men_s_handball_championship([]) :- assert(august_2014_OR_ev_2009_world_men_s_handball_championship(-1,-1)).

generate_facts_august_2014_OR_ev_2009_world_men_s_handball_championship([(Start,End) | Tail]) :- assert(august_2014_OR_ev_2009_world_men_s_handball_championship(Start,End)), generate_facts_august_2014_OR_ev_2009_world_men_s_handball_championship(Tail).

august_2014_OR_ev_2009_world_men_s_handball_championship_aux() :- findall((Start,End),august_2014(Start,End),Interval1), findall((Start,End),ev_2009_world_men_s_handball_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_august_2014_OR_ev_2009_world_men_s_handball_championship(Interval).

august_2014_OR_ev_2009_world_men_s_handball_championship_at_2058(Res) :- setof((Start,End),august_2014_OR_ev_2009_world_men_s_handball_championship(Start,End),AllINtervals), checkvalidity(2058,AllINtervals,Res).

check_query() :- write('Query = august_2014_OR_ev_2009_world_men_s_handball_championship_at_2058'), (august_2014_OR_ev_2009_world_men_s_handball_championship_at_2058(true) -> write('\nRes   = true');write('\nRes   = false')).
?- august_2014_OR_ev_2009_world_men_s_handball_championship_aux().

