:- include('database.pl').
new_imperialism(Start,End) :- begin('new_imperialism',_,_,Start), end('new_imperialism',_,_,End), Start=<End.

geiger_marsden_experiment(Start,End) :- begin('geiger_marsden_experiment',_,_,Start), end('geiger_marsden_experiment',_,_,End), Start=<End.

new_imperialism_last_till_6_12(Start,End) :- new_imperialism(Start1,End1), (End1-Start1)>=6, Start is (Start1+6), End is (End1+1).

new_imperialism_until_geiger_marsden_experiment_during_6_12_overlap(Start,End) :- new_imperialism_last_till_6_12(Start1,End1), geiger_marsden_experiment(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

new_imperialism_until_geiger_marsden_experiment_during_6_12(Start,End) :- new_imperialism(W1,_), new_imperialism_until_geiger_marsden_experiment_during_6_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-6), Start=<End.

new_imperialism_until_geiger_marsden_experiment_during_6_12_at_1903(Res) :- setof((Start,End),new_imperialism_until_geiger_marsden_experiment_during_6_12(Start,End),AllINtervals), checkvalidity(1903,AllINtervals,Res).

check_query() :- write('Query = new_imperialism_until_geiger_marsden_experiment_during_6_12_at_1903'), (new_imperialism_until_geiger_marsden_experiment_during_6_12_at_1903(true) -> write('\nRes   = true');write('\nRes   = false')).

