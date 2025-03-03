:- include('database.pl').
chowder(Start,End) :- begin('chowder',_,_,Start), end('chowder',_,_,End), Start=<End.

ev_2000_formula_one_world_championship(Start,End) :- begin('ev_2000_formula_one_world_championship',_,_,Start), end('ev_2000_formula_one_world_championship',_,_,End), Start=<End.

generate_facts_chowder_OR_ev_2000_formula_one_world_championship([]) :- assert(chowder_OR_ev_2000_formula_one_world_championship(-1,-1)).

generate_facts_chowder_OR_ev_2000_formula_one_world_championship([(Start,End) | Tail]) :- assert(chowder_OR_ev_2000_formula_one_world_championship(Start,End)), generate_facts_chowder_OR_ev_2000_formula_one_world_championship(Tail).

chowder_OR_ev_2000_formula_one_world_championship_aux() :- findall((Start,End),chowder(Start,End),Interval1), findall((Start,End),ev_2000_formula_one_world_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_chowder_OR_ev_2000_formula_one_world_championship(Interval).

chowder_OR_ev_2000_formula_one_world_championship_at_2005(Res) :- setof((Start,End),chowder_OR_ev_2000_formula_one_world_championship(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = chowder_OR_ev_2000_formula_one_world_championship_at_2005'), (chowder_OR_ev_2000_formula_one_world_championship_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- chowder_OR_ev_2000_formula_one_world_championship_aux().

