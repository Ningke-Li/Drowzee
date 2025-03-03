:- include('database.pl').
azuchi_momoyama_period(Start,End) :- begin('azuchi_momoyama_period',_,_,Start), end('azuchi_momoyama_period',_,_,End), Start=<End.

finally_azuchi_momoyama_period_during_6_11(Start,End) :- azuchi_momoyama_period(Start1,End1), (Start1-11)=<(End1-6), Start is (Start1-11), End is (End1-6), Start=<End.

finally_azuchi_momoyama_period_during_6_11_at_1600(Res) :- setof((Start,End),finally_azuchi_momoyama_period_during_6_11(Start,End),AllINtervals), checkvalidity(1600,AllINtervals,Res).

check_query() :- write('Query = finally_azuchi_momoyama_period_during_6_11_at_1600'), (finally_azuchi_momoyama_period_during_6_11_at_1600(true) -> write('\nRes   = true');write('\nRes   = false')).

