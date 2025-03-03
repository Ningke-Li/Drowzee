:- include('database.pl').
ugly_betty(Start,End) :- begin('ugly_betty',_,_,Start), end('ugly_betty',_,_,End), Start=<End.

finally_ugly_betty_during_8_18(Start,End) :- ugly_betty(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_ugly_betty_during_8_18_at_2003(Res) :- setof((Start,End),finally_ugly_betty_during_8_18(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = finally_ugly_betty_during_8_18_at_2003'), (finally_ugly_betty_during_8_18_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

