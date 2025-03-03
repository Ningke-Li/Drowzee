:- include('database.pl').
suits(Start,End) :- begin('suits',_,_,Start), end('suits',_,_,End), Start=<End.

globally_suits_during_3_7(Start,End) :- suits(Start1,End1), Start is (Start1-3), End is (End1-7), Start=<End.

finally_globally_suits_during_3_7_during_5_16(Start,End) :- globally_suits_during_3_7(Start1,End1), (Start1-16)=<(End1-5), Start is (Start1-16), End is (End1-5), Start=<End.

finally_globally_suits_during_3_7_during_5_16_at_1997(Res) :- setof((Start,End),finally_globally_suits_during_3_7_during_5_16(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = finally_globally_suits_during_3_7_during_5_16_at_1997'), (finally_globally_suits_during_3_7_during_5_16_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

