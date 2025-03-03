:- include('database.pl').
cavendish_experiment(Start,End) :- begin('cavendish_experiment',_,_,Start), end('cavendish_experiment',_,_,End), Start=<End.

cuban_war_of_independence(Start,End) :- begin('cuban_war_of_independence',_,_,Start), end('cuban_war_of_independence',_,_,End), Start=<End.

generate_facts_cavendish_experiment_OR_cuban_war_of_independence([]) :- assert(cavendish_experiment_OR_cuban_war_of_independence(-1,-1)).

generate_facts_cavendish_experiment_OR_cuban_war_of_independence([(Start,End) | Tail]) :- assert(cavendish_experiment_OR_cuban_war_of_independence(Start,End)), generate_facts_cavendish_experiment_OR_cuban_war_of_independence(Tail).

cavendish_experiment_OR_cuban_war_of_independence_aux() :- findall((Start,End),cavendish_experiment(Start,End),Interval1), findall((Start,End),cuban_war_of_independence(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_cavendish_experiment_OR_cuban_war_of_independence(Interval).

cavendish_experiment_OR_cuban_war_of_independence_at_1884(Res) :- setof((Start,End),cavendish_experiment_OR_cuban_war_of_independence(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = cavendish_experiment_OR_cuban_war_of_independence_at_1884'), (cavendish_experiment_OR_cuban_war_of_independence_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cavendish_experiment_OR_cuban_war_of_independence_aux().

