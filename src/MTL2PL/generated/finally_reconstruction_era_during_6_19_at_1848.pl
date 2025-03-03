:- include('database.pl').
reconstruction_era(Start,End) :- begin('reconstruction_era',_,_,Start), end('reconstruction_era',_,_,End), Start=<End.

finally_reconstruction_era_during_6_19(Start,End) :- reconstruction_era(Start1,End1), (Start1-19)=<(End1-6), Start is (Start1-19), End is (End1-6), Start=<End.

finally_reconstruction_era_during_6_19_at_1848(Res) :- setof((Start,End),finally_reconstruction_era_during_6_19(Start,End),AllINtervals), checkvalidity(1848,AllINtervals,Res).

check_query() :- write('Query = finally_reconstruction_era_during_6_19_at_1848'), (finally_reconstruction_era_during_6_19_at_1848(true) -> write('\nRes   = true');write('\nRes   = false')).

