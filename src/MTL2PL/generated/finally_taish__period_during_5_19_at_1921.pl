:- include('database.pl').
taish__period(Start,End) :- begin('taish__period',_,_,Start), end('taish__period',_,_,End), Start=<End.

finally_taish__period_during_5_19(Start,End) :- taish__period(Start1,End1), (Start1-19)=<(End1-5), Start is (Start1-19), End is (End1-5), Start=<End.

finally_taish__period_during_5_19_at_1921(Res) :- setof((Start,End),finally_taish__period_during_5_19(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = finally_taish__period_during_5_19_at_1921'), (finally_taish__period_during_5_19_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).

