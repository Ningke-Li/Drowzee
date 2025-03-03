:- include('database.pl').
saar_offensive(Start,End) :- begin('saar_offensive',_,_,Start), end('saar_offensive',_,_,End), Start=<End.

finally_saar_offensive_during_10_12(Start,End) :- saar_offensive(Start1,End1), (Start1-12)=<(End1-10), Start is (Start1-12), End is (End1-10), Start=<End.

finally_saar_offensive_during_10_12_at_1883(Res) :- setof((Start,End),finally_saar_offensive_during_10_12(Start,End),AllINtervals), checkvalidity(1883,AllINtervals,Res).

check_query() :- write('Query = finally_saar_offensive_during_10_12_at_1883'), (finally_saar_offensive_during_10_12_at_1883(true) -> write('\nRes   = true');write('\nRes   = false')).

