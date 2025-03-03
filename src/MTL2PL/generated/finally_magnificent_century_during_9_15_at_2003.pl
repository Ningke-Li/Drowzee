:- include('database.pl').
magnificent_century(Start,End) :- begin('magnificent_century',_,_,Start), end('magnificent_century',_,_,End), Start=<End.

finally_magnificent_century_during_9_15(Start,End) :- magnificent_century(Start1,End1), (Start1-15)=<(End1-9), Start is (Start1-15), End is (End1-9), Start=<End.

finally_magnificent_century_during_9_15_at_2003(Res) :- setof((Start,End),finally_magnificent_century_during_9_15(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = finally_magnificent_century_during_9_15_at_2003'), (finally_magnificent_century_during_9_15_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

