:- include('database.pl').
supernatural(Start,End) :- begin('supernatural',_,_,Start), end('supernatural',_,_,End), Start=<End.

finally_supernatural_during_2_19(Start,End) :- supernatural(Start1,End1), (Start1-19)=<(End1-2), Start is (Start1-19), End is (End1-2), Start=<End.

next_finally_supernatural_during_2_19(Start,End) :- finally_supernatural_during_2_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_supernatural_during_2_19_at_1996(Res) :- setof((Start,End),next_finally_supernatural_during_2_19(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = next_finally_supernatural_during_2_19_at_1996'), (next_finally_supernatural_during_2_19_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

