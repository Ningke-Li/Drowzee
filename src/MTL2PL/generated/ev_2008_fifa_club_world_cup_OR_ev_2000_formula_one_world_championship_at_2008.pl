:- include('database.pl').
ev_2008_fifa_club_world_cup(Start,End) :- begin('ev_2008_fifa_club_world_cup',_,_,Start), end('ev_2008_fifa_club_world_cup',_,_,End), Start=<End.

ev_2000_formula_one_world_championship(Start,End) :- begin('ev_2000_formula_one_world_championship',_,_,Start), end('ev_2000_formula_one_world_championship',_,_,End), Start=<End.

generate_facts_ev_2008_fifa_club_world_cup_OR_ev_2000_formula_one_world_championship([]) :- assert(ev_2008_fifa_club_world_cup_OR_ev_2000_formula_one_world_championship(-1,-1)).

generate_facts_ev_2008_fifa_club_world_cup_OR_ev_2000_formula_one_world_championship([(Start,End) | Tail]) :- assert(ev_2008_fifa_club_world_cup_OR_ev_2000_formula_one_world_championship(Start,End)), generate_facts_ev_2008_fifa_club_world_cup_OR_ev_2000_formula_one_world_championship(Tail).

ev_2008_fifa_club_world_cup_OR_ev_2000_formula_one_world_championship_aux() :- findall((Start,End),ev_2008_fifa_club_world_cup(Start,End),Interval1), findall((Start,End),ev_2000_formula_one_world_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2008_fifa_club_world_cup_OR_ev_2000_formula_one_world_championship(Interval).

ev_2008_fifa_club_world_cup_OR_ev_2000_formula_one_world_championship_at_2008(Res) :- setof((Start,End),ev_2008_fifa_club_world_cup_OR_ev_2000_formula_one_world_championship(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = ev_2008_fifa_club_world_cup_OR_ev_2000_formula_one_world_championship_at_2008'), (ev_2008_fifa_club_world_cup_OR_ev_2000_formula_one_world_championship_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2008_fifa_club_world_cup_OR_ev_2000_formula_one_world_championship_aux().

