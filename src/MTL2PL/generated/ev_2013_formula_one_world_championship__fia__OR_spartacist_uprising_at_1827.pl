:- include('database.pl').
ev_2013_formula_one_world_championship__fia_(Start,End) :- begin('ev_2013_formula_one_world_championship__fia_',_,_,Start), end('ev_2013_formula_one_world_championship__fia_',_,_,End), Start=<End.

spartacist_uprising(Start,End) :- begin('spartacist_uprising',_,_,Start), end('spartacist_uprising',_,_,End), Start=<End.

generate_facts_ev_2013_formula_one_world_championship__fia__OR_spartacist_uprising([]) :- assert(ev_2013_formula_one_world_championship__fia__OR_spartacist_uprising(-1,-1)).

generate_facts_ev_2013_formula_one_world_championship__fia__OR_spartacist_uprising([(Start,End) | Tail]) :- assert(ev_2013_formula_one_world_championship__fia__OR_spartacist_uprising(Start,End)), generate_facts_ev_2013_formula_one_world_championship__fia__OR_spartacist_uprising(Tail).

ev_2013_formula_one_world_championship__fia__OR_spartacist_uprising_aux() :- findall((Start,End),ev_2013_formula_one_world_championship__fia_(Start,End),Interval1), findall((Start,End),spartacist_uprising(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2013_formula_one_world_championship__fia__OR_spartacist_uprising(Interval).

ev_2013_formula_one_world_championship__fia__OR_spartacist_uprising_at_1827(Res) :- setof((Start,End),ev_2013_formula_one_world_championship__fia__OR_spartacist_uprising(Start,End),AllINtervals), checkvalidity(1827,AllINtervals,Res).

check_query() :- write('Query = ev_2013_formula_one_world_championship__fia__OR_spartacist_uprising_at_1827'), (ev_2013_formula_one_world_championship__fia__OR_spartacist_uprising_at_1827(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_formula_one_world_championship__fia__OR_spartacist_uprising_aux().

