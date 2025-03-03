:- include('database.pl').
ev_2010_formula_one_world_championship(Start,End) :- begin('ev_2010_formula_one_world_championship',_,_,Start), end('ev_2010_formula_one_world_championship',_,_,End), Start=<End.

ultimate_spider_man(Start,End) :- begin('ultimate_spider_man',_,_,Start), end('ultimate_spider_man',_,_,End), Start=<End.

generate_facts_ev_2010_formula_one_world_championship_OR_ultimate_spider_man([]) :- assert(ev_2010_formula_one_world_championship_OR_ultimate_spider_man(-1,-1)).

generate_facts_ev_2010_formula_one_world_championship_OR_ultimate_spider_man([(Start,End) | Tail]) :- assert(ev_2010_formula_one_world_championship_OR_ultimate_spider_man(Start,End)), generate_facts_ev_2010_formula_one_world_championship_OR_ultimate_spider_man(Tail).

ev_2010_formula_one_world_championship_OR_ultimate_spider_man_aux() :- findall((Start,End),ev_2010_formula_one_world_championship(Start,End),Interval1), findall((Start,End),ultimate_spider_man(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_formula_one_world_championship_OR_ultimate_spider_man(Interval).

ev_2010_formula_one_world_championship_OR_ultimate_spider_man_at_2014(Res) :- setof((Start,End),ev_2010_formula_one_world_championship_OR_ultimate_spider_man(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = ev_2010_formula_one_world_championship_OR_ultimate_spider_man_at_2014'), (ev_2010_formula_one_world_championship_OR_ultimate_spider_man_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_formula_one_world_championship_OR_ultimate_spider_man_aux().

