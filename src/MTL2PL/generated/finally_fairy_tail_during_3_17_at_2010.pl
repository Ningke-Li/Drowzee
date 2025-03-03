:- include('database.pl').
fairy_tail(Start,End) :- begin('fairy_tail',_,_,Start), end('fairy_tail',_,_,End), Start=<End.

finally_fairy_tail_during_3_17(Start,End) :- fairy_tail(Start1,End1), (Start1-17)=<(End1-3), Start is (Start1-17), End is (End1-3), Start=<End.

finally_fairy_tail_during_3_17_at_2010(Res) :- setof((Start,End),finally_fairy_tail_during_3_17(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = finally_fairy_tail_during_3_17_at_2010'), (finally_fairy_tail_during_3_17_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

