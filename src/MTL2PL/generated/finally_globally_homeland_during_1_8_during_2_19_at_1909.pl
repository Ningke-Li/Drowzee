:- include('database.pl').
homeland(Start,End) :- begin('homeland',_,_,Start), end('homeland',_,_,End), Start=<End.

globally_homeland_during_1_8(Start,End) :- homeland(Start1,End1), Start is (Start1-1), End is (End1-8), Start=<End.

finally_globally_homeland_during_1_8_during_2_19(Start,End) :- globally_homeland_during_1_8(Start1,End1), (Start1-19)=<(End1-2), Start is (Start1-19), End is (End1-2), Start=<End.

finally_globally_homeland_during_1_8_during_2_19_at_1909(Res) :- setof((Start,End),finally_globally_homeland_during_1_8_during_2_19(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = finally_globally_homeland_during_1_8_during_2_19_at_1909'), (finally_globally_homeland_during_1_8_during_2_19_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).

