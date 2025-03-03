:- include('database.pl').
suits(Start,End) :- begin('suits',_,_,Start), end('suits',_,_,End), Start=<End.

finally_suits_during_1_16(Start,End) :- suits(Start1,End1), (Start1-16)=<(End1-1), Start is (Start1-16), End is (End1-1), Start=<End.

globally_finally_suits_during_1_16_during_2_6(Start,End) :- finally_suits_during_1_16(Start1,End1), Start is (Start1-2), End is (End1-6), Start=<End.

globally_finally_suits_during_1_16_during_2_6_at_1865(Res) :- setof((Start,End),globally_finally_suits_during_1_16_during_2_6(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = globally_finally_suits_during_1_16_during_2_6_at_1865'), (globally_finally_suits_during_1_16_during_2_6_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).

