:- include('database.pl').
elementary(Start,End) :- begin('elementary',_,_,Start), end('elementary',_,_,End), Start=<End.

finally_elementary_during_2_18(Start,End) :- elementary(Start1,End1), (Start1-18)=<(End1-2), Start is (Start1-18), End is (End1-2), Start=<End.

finally_elementary_during_2_18_at_1934(Res) :- setof((Start,End),finally_elementary_during_2_18(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = finally_elementary_during_2_18_at_1934'), (finally_elementary_during_2_18_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).

