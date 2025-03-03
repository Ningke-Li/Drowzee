:- include('database.pl').
supernatural(Start,End) :- begin('supernatural',_,_,Start), end('supernatural',_,_,End), Start=<End.

finally_supernatural_during_8_18(Start,End) :- supernatural(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_supernatural_during_8_18_at_1994(Res) :- setof((Start,End),finally_supernatural_during_8_18(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = finally_supernatural_during_8_18_at_1994'), (finally_supernatural_during_8_18_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).

