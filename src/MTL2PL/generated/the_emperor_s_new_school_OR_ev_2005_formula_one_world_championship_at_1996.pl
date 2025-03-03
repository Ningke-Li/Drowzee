:- include('database.pl').
the_emperor_s_new_school(Start,End) :- begin('the_emperor_s_new_school',_,_,Start), end('the_emperor_s_new_school',_,_,End), Start=<End.

ev_2005_formula_one_world_championship(Start,End) :- begin('ev_2005_formula_one_world_championship',_,_,Start), end('ev_2005_formula_one_world_championship',_,_,End), Start=<End.

generate_facts_the_emperor_s_new_school_OR_ev_2005_formula_one_world_championship([]) :- assert(the_emperor_s_new_school_OR_ev_2005_formula_one_world_championship(-1,-1)).

generate_facts_the_emperor_s_new_school_OR_ev_2005_formula_one_world_championship([(Start,End) | Tail]) :- assert(the_emperor_s_new_school_OR_ev_2005_formula_one_world_championship(Start,End)), generate_facts_the_emperor_s_new_school_OR_ev_2005_formula_one_world_championship(Tail).

the_emperor_s_new_school_OR_ev_2005_formula_one_world_championship_aux() :- findall((Start,End),the_emperor_s_new_school(Start,End),Interval1), findall((Start,End),ev_2005_formula_one_world_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_emperor_s_new_school_OR_ev_2005_formula_one_world_championship(Interval).

the_emperor_s_new_school_OR_ev_2005_formula_one_world_championship_at_1996(Res) :- setof((Start,End),the_emperor_s_new_school_OR_ev_2005_formula_one_world_championship(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = the_emperor_s_new_school_OR_ev_2005_formula_one_world_championship_at_1996'), (the_emperor_s_new_school_OR_ev_2005_formula_one_world_championship_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_emperor_s_new_school_OR_ev_2005_formula_one_world_championship_aux().

