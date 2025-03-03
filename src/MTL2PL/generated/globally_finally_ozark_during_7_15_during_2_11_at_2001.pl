:- include('database.pl').
ozark(Start,End) :- begin('ozark',_,_,Start), end('ozark',_,_,End), Start=<End.

finally_ozark_during_7_15(Start,End) :- ozark(Start1,End1), (Start1-15)=<(End1-7), Start is (Start1-15), End is (End1-7), Start=<End.

globally_finally_ozark_during_7_15_during_2_11(Start,End) :- finally_ozark_during_7_15(Start1,End1), Start is (Start1-2), End is (End1-11), Start=<End.

globally_finally_ozark_during_7_15_during_2_11_at_2001(Res) :- setof((Start,End),globally_finally_ozark_during_7_15_during_2_11(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = globally_finally_ozark_during_7_15_during_2_11_at_2001'), (globally_finally_ozark_during_7_15_during_2_11_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

