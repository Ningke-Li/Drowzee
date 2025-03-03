:- include('database.pl').
ottoman_interregnum(Start,End) :- begin('ottoman_interregnum',_,_,Start), end('ottoman_interregnum',_,_,End), Start=<End.

finally_ottoman_interregnum_during_1_14(Start,End) :- ottoman_interregnum(Start1,End1), (Start1-14)=<(End1-1), Start is (Start1-14), End is (End1-1), Start=<End.

finally_ottoman_interregnum_during_1_14_at_1296(Res) :- setof((Start,End),finally_ottoman_interregnum_during_1_14(Start,End),AllINtervals), checkvalidity(1296,AllINtervals,Res).

check_query() :- write('Query = finally_ottoman_interregnum_during_1_14_at_1296'), (finally_ottoman_interregnum_during_1_14_at_1296(true) -> write('\nRes   = true');write('\nRes   = false')).

