:- include('database.pl').
fairy_tail(Start,End) :- begin('fairy_tail',_,_,Start), end('fairy_tail',_,_,End), Start=<End.

globally_fairy_tail_during_2_10(Start,End) :- fairy_tail(Start1,End1), Start is (Start1-2), End is (End1-10), Start=<End.

finally_globally_fairy_tail_during_2_10_during_6_14(Start,End) :- globally_fairy_tail_during_2_10(Start1,End1), (Start1-14)=<(End1-6), Start is (Start1-14), End is (End1-6), Start=<End.

finally_globally_fairy_tail_during_2_10_during_6_14_at_1920(Res) :- setof((Start,End),finally_globally_fairy_tail_during_2_10_during_6_14(Start,End),AllINtervals), checkvalidity(1920,AllINtervals,Res).

check_query() :- write('Query = finally_globally_fairy_tail_during_2_10_during_6_14_at_1920'), (finally_globally_fairy_tail_during_2_10_during_6_14_at_1920(true) -> write('\nRes   = true');write('\nRes   = false')).

