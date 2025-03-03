:- include('database.pl').
brooklyn_nine_nine(Start,End) :- begin('brooklyn_nine_nine',_,_,Start), end('brooklyn_nine_nine',_,_,End), Start=<End.

finally_brooklyn_nine_nine_during_8_19(Start,End) :- brooklyn_nine_nine(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

globally_finally_brooklyn_nine_nine_during_8_19_during_3_13(Start,End) :- finally_brooklyn_nine_nine_during_8_19(Start1,End1), Start is (Start1-3), End is (End1-13), Start=<End.

globally_finally_brooklyn_nine_nine_during_8_19_during_3_13_at_2003(Res) :- setof((Start,End),globally_finally_brooklyn_nine_nine_during_8_19_during_3_13(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = globally_finally_brooklyn_nine_nine_during_8_19_during_3_13_at_2003'), (globally_finally_brooklyn_nine_nine_during_8_19_during_3_13_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

