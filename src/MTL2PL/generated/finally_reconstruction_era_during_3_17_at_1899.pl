:- include('database.pl').
reconstruction_era(Start,End) :- begin('reconstruction_era',_,_,Start), end('reconstruction_era',_,_,End), Start=<End.

finally_reconstruction_era_during_3_17(Start,End) :- reconstruction_era(Start1,End1), (Start1-17)=<(End1-3), Start is (Start1-17), End is (End1-3), Start=<End.

finally_reconstruction_era_during_3_17_at_1899(Res) :- setof((Start,End),finally_reconstruction_era_during_3_17(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = finally_reconstruction_era_during_3_17_at_1899'), (finally_reconstruction_era_during_3_17_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).

