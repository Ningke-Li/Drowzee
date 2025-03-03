:- include('database.pl').
smallville(Start,End) :- begin('smallville',_,_,Start), end('smallville',_,_,End), Start=<End.

finally_smallville_during_6_13(Start,End) :- smallville(Start1,End1), (Start1-13)=<(End1-6), Start is (Start1-13), End is (End1-6), Start=<End.

finally_smallville_during_6_13_at_2003(Res) :- setof((Start,End),finally_smallville_during_6_13(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = finally_smallville_during_6_13_at_2003'), (finally_smallville_during_6_13_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

