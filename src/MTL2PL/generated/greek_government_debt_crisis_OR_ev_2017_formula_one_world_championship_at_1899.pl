:- include('database.pl').
greek_government_debt_crisis(Start,End) :- begin('greek_government_debt_crisis',_,_,Start), end('greek_government_debt_crisis',_,_,End), Start=<End.

ev_2017_formula_one_world_championship(Start,End) :- begin('ev_2017_formula_one_world_championship',_,_,Start), end('ev_2017_formula_one_world_championship',_,_,End), Start=<End.

generate_facts_greek_government_debt_crisis_OR_ev_2017_formula_one_world_championship([]) :- assert(greek_government_debt_crisis_OR_ev_2017_formula_one_world_championship(-1,-1)).

generate_facts_greek_government_debt_crisis_OR_ev_2017_formula_one_world_championship([(Start,End) | Tail]) :- assert(greek_government_debt_crisis_OR_ev_2017_formula_one_world_championship(Start,End)), generate_facts_greek_government_debt_crisis_OR_ev_2017_formula_one_world_championship(Tail).

greek_government_debt_crisis_OR_ev_2017_formula_one_world_championship_aux() :- findall((Start,End),greek_government_debt_crisis(Start,End),Interval1), findall((Start,End),ev_2017_formula_one_world_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_greek_government_debt_crisis_OR_ev_2017_formula_one_world_championship(Interval).

greek_government_debt_crisis_OR_ev_2017_formula_one_world_championship_at_1899(Res) :- setof((Start,End),greek_government_debt_crisis_OR_ev_2017_formula_one_world_championship(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = greek_government_debt_crisis_OR_ev_2017_formula_one_world_championship_at_1899'), (greek_government_debt_crisis_OR_ev_2017_formula_one_world_championship_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).
?- greek_government_debt_crisis_OR_ev_2017_formula_one_world_championship_aux().

