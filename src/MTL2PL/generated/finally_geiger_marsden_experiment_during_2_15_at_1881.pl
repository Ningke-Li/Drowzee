:- include('database.pl').
geiger_marsden_experiment(Start,End) :- begin('geiger_marsden_experiment',_,_,Start), end('geiger_marsden_experiment',_,_,End), Start=<End.

finally_geiger_marsden_experiment_during_2_15(Start,End) :- geiger_marsden_experiment(Start1,End1), (Start1-15)=<(End1-2), Start is (Start1-15), End is (End1-2), Start=<End.

finally_geiger_marsden_experiment_during_2_15_at_1881(Res) :- setof((Start,End),finally_geiger_marsden_experiment_during_2_15(Start,End),AllINtervals), checkvalidity(1881,AllINtervals,Res).

check_query() :- write('Query = finally_geiger_marsden_experiment_during_2_15_at_1881'), (finally_geiger_marsden_experiment_during_2_15_at_1881(true) -> write('\nRes   = true');write('\nRes   = false')).

