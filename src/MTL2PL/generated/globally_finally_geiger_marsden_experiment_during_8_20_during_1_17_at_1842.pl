:- include('database.pl').
geiger_marsden_experiment(Start,End) :- begin('geiger_marsden_experiment',_,_,Start), end('geiger_marsden_experiment',_,_,End), Start=<End.

finally_geiger_marsden_experiment_during_8_20(Start,End) :- geiger_marsden_experiment(Start1,End1), (Start1-20)=<(End1-8), Start is (Start1-20), End is (End1-8), Start=<End.

globally_finally_geiger_marsden_experiment_during_8_20_during_1_17(Start,End) :- finally_geiger_marsden_experiment_during_8_20(Start1,End1), Start is (Start1-1), End is (End1-17), Start=<End.

globally_finally_geiger_marsden_experiment_during_8_20_during_1_17_at_1842(Res) :- setof((Start,End),globally_finally_geiger_marsden_experiment_during_8_20_during_1_17(Start,End),AllINtervals), checkvalidity(1842,AllINtervals,Res).

check_query() :- write('Query = globally_finally_geiger_marsden_experiment_during_8_20_during_1_17_at_1842'), (globally_finally_geiger_marsden_experiment_during_8_20_during_1_17_at_1842(true) -> write('\nRes   = true');write('\nRes   = false')).

