:- include('database.pl').
ottoman_interregnum(Start,End) :- begin('ottoman_interregnum',_,_,Start), end('ottoman_interregnum',_,_,End), Start=<End.

globally_ottoman_interregnum_during_3_11(Start,End) :- ottoman_interregnum(Start1,End1), Start is (Start1-3), End is (End1-11), Start=<End.

finally_globally_ottoman_interregnum_during_3_11_during_2_14(Start,End) :- globally_ottoman_interregnum_during_3_11(Start1,End1), (Start1-14)=<(End1-2), Start is (Start1-14), End is (End1-2), Start=<End.

finally_globally_ottoman_interregnum_during_3_11_during_2_14_at_1308(Res) :- setof((Start,End),finally_globally_ottoman_interregnum_during_3_11_during_2_14(Start,End),AllINtervals), checkvalidity(1308,AllINtervals,Res).

check_query() :- write('Query = finally_globally_ottoman_interregnum_during_3_11_during_2_14_at_1308'), (finally_globally_ottoman_interregnum_during_3_11_during_2_14_at_1308(true) -> write('\nRes   = true');write('\nRes   = false')).

