:- include('database.pl').
invasion_of_yugoslavia(Start,End) :- begin('invasion_of_yugoslavia',_,_,Start), end('invasion_of_yugoslavia',_,_,End), Start=<End.

ev_2009_world_men_s_handball_championship(Start,End) :- begin('ev_2009_world_men_s_handball_championship',_,_,Start), end('ev_2009_world_men_s_handball_championship',_,_,End), Start=<End.

generate_facts_invasion_of_yugoslavia_OR_ev_2009_world_men_s_handball_championship([]) :- assert(invasion_of_yugoslavia_OR_ev_2009_world_men_s_handball_championship(-1,-1)).

generate_facts_invasion_of_yugoslavia_OR_ev_2009_world_men_s_handball_championship([(Start,End) | Tail]) :- assert(invasion_of_yugoslavia_OR_ev_2009_world_men_s_handball_championship(Start,End)), generate_facts_invasion_of_yugoslavia_OR_ev_2009_world_men_s_handball_championship(Tail).

invasion_of_yugoslavia_OR_ev_2009_world_men_s_handball_championship_aux() :- findall((Start,End),invasion_of_yugoslavia(Start,End),Interval1), findall((Start,End),ev_2009_world_men_s_handball_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_invasion_of_yugoslavia_OR_ev_2009_world_men_s_handball_championship(Interval).

invasion_of_yugoslavia_OR_ev_2009_world_men_s_handball_championship_at_2009(Res) :- setof((Start,End),invasion_of_yugoslavia_OR_ev_2009_world_men_s_handball_championship(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = invasion_of_yugoslavia_OR_ev_2009_world_men_s_handball_championship_at_2009'), (invasion_of_yugoslavia_OR_ev_2009_world_men_s_handball_championship_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- invasion_of_yugoslavia_OR_ev_2009_world_men_s_handball_championship_aux().

