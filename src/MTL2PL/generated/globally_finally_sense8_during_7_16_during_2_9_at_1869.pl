:- include('database.pl').
sense8(Start,End) :- begin('sense8',_,_,Start), end('sense8',_,_,End), Start=<End.

finally_sense8_during_7_16(Start,End) :- sense8(Start1,End1), (Start1-16)=<(End1-7), Start is (Start1-16), End is (End1-7), Start=<End.

globally_finally_sense8_during_7_16_during_2_9(Start,End) :- finally_sense8_during_7_16(Start1,End1), Start is (Start1-2), End is (End1-9), Start=<End.

globally_finally_sense8_during_7_16_during_2_9_at_1869(Res) :- setof((Start,End),globally_finally_sense8_during_7_16_during_2_9(Start,End),AllINtervals), checkvalidity(1869,AllINtervals,Res).

check_query() :- write('Query = globally_finally_sense8_during_7_16_during_2_9_at_1869'), (globally_finally_sense8_during_7_16_during_2_9_at_1869(true) -> write('\nRes   = true');write('\nRes   = false')).

