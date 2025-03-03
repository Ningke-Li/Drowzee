:- include('database.pl').
modern_family(Start,End) :- begin('modern_family',_,_,Start), end('modern_family',_,_,End), Start=<End.

ev_2011_fifa_women_s_world_cup(Start,End) :- begin('ev_2011_fifa_women_s_world_cup',_,_,Start), end('ev_2011_fifa_women_s_world_cup',_,_,End), Start=<End.

generate_facts_modern_family_OR_ev_2011_fifa_women_s_world_cup([]) :- assert(modern_family_OR_ev_2011_fifa_women_s_world_cup(-1,-1)).

generate_facts_modern_family_OR_ev_2011_fifa_women_s_world_cup([(Start,End) | Tail]) :- assert(modern_family_OR_ev_2011_fifa_women_s_world_cup(Start,End)), generate_facts_modern_family_OR_ev_2011_fifa_women_s_world_cup(Tail).

modern_family_OR_ev_2011_fifa_women_s_world_cup_aux() :- findall((Start,End),modern_family(Start,End),Interval1), findall((Start,End),ev_2011_fifa_women_s_world_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_modern_family_OR_ev_2011_fifa_women_s_world_cup(Interval).

modern_family_OR_ev_2011_fifa_women_s_world_cup_at_1925(Res) :- setof((Start,End),modern_family_OR_ev_2011_fifa_women_s_world_cup(Start,End),AllINtervals), checkvalidity(1925,AllINtervals,Res).

check_query() :- write('Query = modern_family_OR_ev_2011_fifa_women_s_world_cup_at_1925'), (modern_family_OR_ev_2011_fifa_women_s_world_cup_at_1925(true) -> write('\nRes   = true');write('\nRes   = false')).
?- modern_family_OR_ev_2011_fifa_women_s_world_cup_aux().

