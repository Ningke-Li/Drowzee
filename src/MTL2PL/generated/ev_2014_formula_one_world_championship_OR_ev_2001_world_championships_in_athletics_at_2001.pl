:- include('database.pl').
ev_2014_formula_one_world_championship(Start,End) :- begin('ev_2014_formula_one_world_championship',_,_,Start), end('ev_2014_formula_one_world_championship',_,_,End), Start=<End.

ev_2001_world_championships_in_athletics(Start,End) :- begin('ev_2001_world_championships_in_athletics',_,_,Start), end('ev_2001_world_championships_in_athletics',_,_,End), Start=<End.

generate_facts_ev_2014_formula_one_world_championship_OR_ev_2001_world_championships_in_athletics([]) :- assert(ev_2014_formula_one_world_championship_OR_ev_2001_world_championships_in_athletics(-1,-1)).

generate_facts_ev_2014_formula_one_world_championship_OR_ev_2001_world_championships_in_athletics([(Start,End) | Tail]) :- assert(ev_2014_formula_one_world_championship_OR_ev_2001_world_championships_in_athletics(Start,End)), generate_facts_ev_2014_formula_one_world_championship_OR_ev_2001_world_championships_in_athletics(Tail).

ev_2014_formula_one_world_championship_OR_ev_2001_world_championships_in_athletics_aux() :- findall((Start,End),ev_2014_formula_one_world_championship(Start,End),Interval1), findall((Start,End),ev_2001_world_championships_in_athletics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_formula_one_world_championship_OR_ev_2001_world_championships_in_athletics(Interval).

ev_2014_formula_one_world_championship_OR_ev_2001_world_championships_in_athletics_at_2001(Res) :- setof((Start,End),ev_2014_formula_one_world_championship_OR_ev_2001_world_championships_in_athletics(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = ev_2014_formula_one_world_championship_OR_ev_2001_world_championships_in_athletics_at_2001'), (ev_2014_formula_one_world_championship_OR_ev_2001_world_championships_in_athletics_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_formula_one_world_championship_OR_ev_2001_world_championships_in_athletics_aux().

