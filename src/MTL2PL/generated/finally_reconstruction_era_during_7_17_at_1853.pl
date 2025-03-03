:- include('database.pl').
reconstruction_era(Start,End) :- begin('reconstruction_era',_,_,Start), end('reconstruction_era',_,_,End), Start=<End.

finally_reconstruction_era_during_7_17(Start,End) :- reconstruction_era(Start1,End1), (Start1-17)=<(End1-7), Start is (Start1-17), End is (End1-7), Start=<End.

finally_reconstruction_era_during_7_17_at_1853(Res) :- setof((Start,End),finally_reconstruction_era_during_7_17(Start,End),AllINtervals), checkvalidity(1853,AllINtervals,Res).

check_query() :- write('Query = finally_reconstruction_era_during_7_17_at_1853'), (finally_reconstruction_era_during_7_17_at_1853(true) -> write('\nRes   = true');write('\nRes   = false')).

