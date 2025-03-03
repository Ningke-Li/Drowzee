:- include('database.pl').
fronde(Start,End) :- begin('fronde',_,_,Start), end('fronde',_,_,End), Start=<End.

ev_2013_world_men_s_handball_championship(Start,End) :- begin('ev_2013_world_men_s_handball_championship',_,_,Start), end('ev_2013_world_men_s_handball_championship',_,_,End), Start=<End.

generate_facts_fronde_OR_ev_2013_world_men_s_handball_championship([]) :- assert(fronde_OR_ev_2013_world_men_s_handball_championship(-1,-1)).

generate_facts_fronde_OR_ev_2013_world_men_s_handball_championship([(Start,End) | Tail]) :- assert(fronde_OR_ev_2013_world_men_s_handball_championship(Start,End)), generate_facts_fronde_OR_ev_2013_world_men_s_handball_championship(Tail).

fronde_OR_ev_2013_world_men_s_handball_championship_aux() :- findall((Start,End),fronde(Start,End),Interval1), findall((Start,End),ev_2013_world_men_s_handball_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_fronde_OR_ev_2013_world_men_s_handball_championship(Interval).

fronde_OR_ev_2013_world_men_s_handball_championship_at_1981(Res) :- setof((Start,End),fronde_OR_ev_2013_world_men_s_handball_championship(Start,End),AllINtervals), checkvalidity(1981,AllINtervals,Res).

check_query() :- write('Query = fronde_OR_ev_2013_world_men_s_handball_championship_at_1981'), (fronde_OR_ev_2013_world_men_s_handball_championship_at_1981(true) -> write('\nRes   = true');write('\nRes   = false')).
?- fronde_OR_ev_2013_world_men_s_handball_championship_aux().

