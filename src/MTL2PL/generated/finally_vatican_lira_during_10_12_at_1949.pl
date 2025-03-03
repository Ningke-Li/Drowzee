:- include('database.pl').
vatican_lira(Start,End) :- begin('vatican_lira',_,_,Start), end('vatican_lira',_,_,End), Start=<End.

finally_vatican_lira_during_10_12(Start,End) :- vatican_lira(Start1,End1), (Start1-12)=<(End1-10), Start is (Start1-12), End is (End1-10), Start=<End.

finally_vatican_lira_during_10_12_at_1949(Res) :- setof((Start,End),finally_vatican_lira_during_10_12(Start,End),AllINtervals), checkvalidity(1949,AllINtervals,Res).

check_query() :- write('Query = finally_vatican_lira_during_10_12_at_1949'), (finally_vatican_lira_during_10_12_at_1949(true) -> write('\nRes   = true');write('\nRes   = false')).

