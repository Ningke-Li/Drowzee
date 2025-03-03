:- include('database.pl').
belle__poque(Start,End) :- begin('belle__poque',_,_,Start), end('belle__poque',_,_,End), Start=<End.

finally_belle__poque_during_2_19(Start,End) :- belle__poque(Start1,End1), (Start1-19)=<(End1-2), Start is (Start1-19), End is (End1-2), Start=<End.

finally_belle__poque_during_2_19_at_1773(Res) :- setof((Start,End),finally_belle__poque_during_2_19(Start,End),AllINtervals), checkvalidity(1773,AllINtervals,Res).

check_query() :- write('Query = finally_belle__poque_during_2_19_at_1773'), (finally_belle__poque_during_2_19_at_1773(true) -> write('\nRes   = true');write('\nRes   = false')).

