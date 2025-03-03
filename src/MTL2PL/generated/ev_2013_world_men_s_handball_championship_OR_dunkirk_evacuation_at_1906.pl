:- include('database.pl').
ev_2013_world_men_s_handball_championship(Start,End) :- begin('ev_2013_world_men_s_handball_championship',_,_,Start), end('ev_2013_world_men_s_handball_championship',_,_,End), Start=<End.

dunkirk_evacuation(Start,End) :- begin('dunkirk_evacuation',_,_,Start), end('dunkirk_evacuation',_,_,End), Start=<End.

generate_facts_ev_2013_world_men_s_handball_championship_OR_dunkirk_evacuation([]) :- assert(ev_2013_world_men_s_handball_championship_OR_dunkirk_evacuation(-1,-1)).

generate_facts_ev_2013_world_men_s_handball_championship_OR_dunkirk_evacuation([(Start,End) | Tail]) :- assert(ev_2013_world_men_s_handball_championship_OR_dunkirk_evacuation(Start,End)), generate_facts_ev_2013_world_men_s_handball_championship_OR_dunkirk_evacuation(Tail).

ev_2013_world_men_s_handball_championship_OR_dunkirk_evacuation_aux() :- findall((Start,End),ev_2013_world_men_s_handball_championship(Start,End),Interval1), findall((Start,End),dunkirk_evacuation(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2013_world_men_s_handball_championship_OR_dunkirk_evacuation(Interval).

ev_2013_world_men_s_handball_championship_OR_dunkirk_evacuation_at_1906(Res) :- setof((Start,End),ev_2013_world_men_s_handball_championship_OR_dunkirk_evacuation(Start,End),AllINtervals), checkvalidity(1906,AllINtervals,Res).

check_query() :- write('Query = ev_2013_world_men_s_handball_championship_OR_dunkirk_evacuation_at_1906'), (ev_2013_world_men_s_handball_championship_OR_dunkirk_evacuation_at_1906(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_world_men_s_handball_championship_OR_dunkirk_evacuation_aux().

