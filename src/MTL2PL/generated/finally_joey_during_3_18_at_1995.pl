:- include('database.pl').
joey(Start,End) :- begin('joey',_,_,Start), end('joey',_,_,End), Start=<End.

finally_joey_during_3_18(Start,End) :- joey(Start1,End1), (Start1-18)=<(End1-3), Start is (Start1-18), End is (End1-3), Start=<End.

finally_joey_during_3_18_at_1995(Res) :- setof((Start,End),finally_joey_during_3_18(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = finally_joey_during_3_18_at_1995'), (finally_joey_during_3_18_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

