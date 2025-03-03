:- include('database.pl').
belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

geiger_marsden_experiment(Start,End) :- begin('geiger_marsden_experiment',_,_,Start), end('geiger_marsden_experiment',_,_,End), Start=<End.

generate_facts_belgian_franc_AND_geiger_marsden_experiment([]) :- assert(belgian_franc_AND_geiger_marsden_experiment(-1,-1)).

generate_facts_belgian_franc_AND_geiger_marsden_experiment([(Start,End) | Tail]) :- assert(belgian_franc_AND_geiger_marsden_experiment(Start,End)), generate_facts_belgian_franc_AND_geiger_marsden_experiment(Tail).

belgian_franc_AND_geiger_marsden_experiment_aux() :- findall((Start,End),belgian_franc(Start,End),Interval1), findall((Start,End),geiger_marsden_experiment(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_belgian_franc_AND_geiger_marsden_experiment(Interval).

belgian_franc_AND_geiger_marsden_experiment_at_1926(Res) :- setof((Start,End),belgian_franc_AND_geiger_marsden_experiment(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = belgian_franc_AND_geiger_marsden_experiment_at_1926'), (belgian_franc_AND_geiger_marsden_experiment_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).
?- belgian_franc_AND_geiger_marsden_experiment_aux().

