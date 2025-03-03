:- include('database.pl').
geiger_marsden_experiment(Start,End) :- begin('geiger_marsden_experiment',_,_,Start), end('geiger_marsden_experiment',_,_,End), Start=<End.

finally_geiger_marsden_experiment_during_6_20(Start,End) :- geiger_marsden_experiment(Start1,End1), (Start1-20)=<(End1-6), Start is (Start1-20), End is (End1-6), Start=<End.

finally_geiger_marsden_experiment_during_6_20_at_1894(Res) :- setof((Start,End),finally_geiger_marsden_experiment_during_6_20(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = finally_geiger_marsden_experiment_during_6_20_at_1894'), (finally_geiger_marsden_experiment_during_6_20_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).

