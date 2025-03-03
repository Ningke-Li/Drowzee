:- include('database.pl').
scrubs(Start,End) :- begin('scrubs',_,_,Start), end('scrubs',_,_,End), Start=<End.

finally_scrubs_during_1_17(Start,End) :- scrubs(Start1,End1), (Start1-17)=<(End1-1), Start is (Start1-17), End is (End1-1), Start=<End.

finally_scrubs_during_1_17_at_1876(Res) :- setof((Start,End),finally_scrubs_during_1_17(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = finally_scrubs_during_1_17_at_1876'), (finally_scrubs_during_1_17_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).

