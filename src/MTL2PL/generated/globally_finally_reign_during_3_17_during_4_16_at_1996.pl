:- include('database.pl').
reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

finally_reign_during_3_17(Start,End) :- reign(Start1,End1), (Start1-17)=<(End1-3), Start is (Start1-17), End is (End1-3), Start=<End.

globally_finally_reign_during_3_17_during_4_16(Start,End) :- finally_reign_during_3_17(Start1,End1), Start is (Start1-4), End is (End1-16), Start=<End.

globally_finally_reign_during_3_17_during_4_16_at_1996(Res) :- setof((Start,End),globally_finally_reign_during_3_17_during_4_16(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = globally_finally_reign_during_3_17_during_4_16_at_1996'), (globally_finally_reign_during_3_17_during_4_16_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

