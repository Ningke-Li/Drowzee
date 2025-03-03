:- include('database.pl').
tulsa_race_massacre(Start,End) :- begin('tulsa_race_massacre',_,_,Start), end('tulsa_race_massacre',_,_,End), Start=<End.

finally_tulsa_race_massacre_during_8_19(Start,End) :- tulsa_race_massacre(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

finally_tulsa_race_massacre_during_8_19_at_1903(Res) :- setof((Start,End),finally_tulsa_race_massacre_during_8_19(Start,End),AllINtervals), checkvalidity(1903,AllINtervals,Res).

check_query() :- write('Query = finally_tulsa_race_massacre_during_8_19_at_1903'), (finally_tulsa_race_massacre_during_8_19_at_1903(true) -> write('\nRes   = true');write('\nRes   = false')).

