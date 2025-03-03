:- include('database.pl').
hannibal(Start,End) :- begin('hannibal',_,_,Start), end('hannibal',_,_,End), Start=<End.

finally_hannibal_during_7_19(Start,End) :- hannibal(Start1,End1), (Start1-19)=<(End1-7), Start is (Start1-19), End is (End1-7), Start=<End.

finally_hannibal_during_7_19_at_1996(Res) :- setof((Start,End),finally_hannibal_during_7_19(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = finally_hannibal_during_7_19_at_1996'), (finally_hannibal_during_7_19_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

