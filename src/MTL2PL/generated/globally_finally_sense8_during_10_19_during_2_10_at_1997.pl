:- include('database.pl').
sense8(Start,End) :- begin('sense8',_,_,Start), end('sense8',_,_,End), Start=<End.

finally_sense8_during_10_19(Start,End) :- sense8(Start1,End1), (Start1-19)=<(End1-10), Start is (Start1-19), End is (End1-10), Start=<End.

globally_finally_sense8_during_10_19_during_2_10(Start,End) :- finally_sense8_during_10_19(Start1,End1), Start is (Start1-2), End is (End1-10), Start=<End.

globally_finally_sense8_during_10_19_during_2_10_at_1997(Res) :- setof((Start,End),globally_finally_sense8_during_10_19_during_2_10(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = globally_finally_sense8_during_10_19_during_2_10_at_1997'), (globally_finally_sense8_during_10_19_during_2_10_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

