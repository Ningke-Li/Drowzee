:- include('database.pl').
ev_2005_formula_one_world_championship(Start,End) :- begin('ev_2005_formula_one_world_championship',_,_,Start), end('ev_2005_formula_one_world_championship',_,_,End), Start=<End.

twitter(Start,End) :- begin('twitter',_,_,Start), end('twitter',_,_,End), Start=<End.

generate_facts_ev_2005_formula_one_world_championship_OR_twitter([]) :- assert(ev_2005_formula_one_world_championship_OR_twitter(-1,-1)).

generate_facts_ev_2005_formula_one_world_championship_OR_twitter([(Start,End) | Tail]) :- assert(ev_2005_formula_one_world_championship_OR_twitter(Start,End)), generate_facts_ev_2005_formula_one_world_championship_OR_twitter(Tail).

ev_2005_formula_one_world_championship_OR_twitter_aux() :- findall((Start,End),ev_2005_formula_one_world_championship(Start,End),Interval1), findall((Start,End),twitter(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2005_formula_one_world_championship_OR_twitter(Interval).

ev_2005_formula_one_world_championship_OR_twitter_at_2014(Res) :- setof((Start,End),ev_2005_formula_one_world_championship_OR_twitter(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = ev_2005_formula_one_world_championship_OR_twitter_at_2014'), (ev_2005_formula_one_world_championship_OR_twitter_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2005_formula_one_world_championship_OR_twitter_aux().

