:- include('database.pl').
ev_2007_fifa_women_s_world_cup(Start,End) :- begin('ev_2007_fifa_women_s_world_cup',_,_,Start), end('ev_2007_fifa_women_s_world_cup',_,_,End), Start=<End.

napoleonic_wars(Start,End) :- begin('napoleonic_wars',_,_,Start), end('napoleonic_wars',_,_,End), Start=<End.

generate_facts_ev_2007_fifa_women_s_world_cup_OR_napoleonic_wars([]) :- assert(ev_2007_fifa_women_s_world_cup_OR_napoleonic_wars(-1,-1)).

generate_facts_ev_2007_fifa_women_s_world_cup_OR_napoleonic_wars([(Start,End) | Tail]) :- assert(ev_2007_fifa_women_s_world_cup_OR_napoleonic_wars(Start,End)), generate_facts_ev_2007_fifa_women_s_world_cup_OR_napoleonic_wars(Tail).

ev_2007_fifa_women_s_world_cup_OR_napoleonic_wars_aux() :- findall((Start,End),ev_2007_fifa_women_s_world_cup(Start,End),Interval1), findall((Start,End),napoleonic_wars(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2007_fifa_women_s_world_cup_OR_napoleonic_wars(Interval).

ev_2007_fifa_women_s_world_cup_OR_napoleonic_wars_at_2048(Res) :- setof((Start,End),ev_2007_fifa_women_s_world_cup_OR_napoleonic_wars(Start,End),AllINtervals), checkvalidity(2048,AllINtervals,Res).

check_query() :- write('Query = ev_2007_fifa_women_s_world_cup_OR_napoleonic_wars_at_2048'), (ev_2007_fifa_women_s_world_cup_OR_napoleonic_wars_at_2048(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2007_fifa_women_s_world_cup_OR_napoleonic_wars_aux().

