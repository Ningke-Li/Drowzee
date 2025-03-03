:- include('database.pl').
ottoman_interregnum(Start,End) :- begin('ottoman_interregnum',_,_,Start), end('ottoman_interregnum',_,_,End), Start=<End.

finally_ottoman_interregnum_during_5_18(Start,End) :- ottoman_interregnum(Start1,End1), (Start1-18)=<(End1-5), Start is (Start1-18), End is (End1-5), Start=<End.

globally_finally_ottoman_interregnum_during_5_18_during_13_24(Start,End) :- finally_ottoman_interregnum_during_5_18(Start1,End1), Start is (Start1-13), End is (End1-24), Start=<End.

globally_finally_ottoman_interregnum_during_5_18_during_13_24_at_1293(Res) :- setof((Start,End),globally_finally_ottoman_interregnum_during_5_18_during_13_24(Start,End),AllINtervals), checkvalidity(1293,AllINtervals,Res).

check_query() :- write('Query = globally_finally_ottoman_interregnum_during_5_18_during_13_24_at_1293'), (globally_finally_ottoman_interregnum_during_5_18_during_13_24_at_1293(true) -> write('\nRes   = true');write('\nRes   = false')).

