:- include('database.pl').
belle__poque(Start,End) :- begin('belle__poque',_,_,Start), end('belle__poque',_,_,End), Start=<End.

finally_belle__poque_during_6_18(Start,End) :- belle__poque(Start1,End1), (Start1-18)=<(End1-6), Start is (Start1-18), End is (End1-6), Start=<End.

finally_belle__poque_during_6_18_at_1744(Res) :- setof((Start,End),finally_belle__poque_during_6_18(Start,End),AllINtervals), checkvalidity(1744,AllINtervals,Res).

check_query() :- write('Query = finally_belle__poque_during_6_18_at_1744'), (finally_belle__poque_during_6_18_at_1744(true) -> write('\nRes   = true');write('\nRes   = false')).

