:- include('database.pl').
sense8(Start,End) :- begin('sense8',_,_,Start), end('sense8',_,_,End), Start=<End.

globally_sense8_during_2_3(Start,End) :- sense8(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

finally_globally_sense8_during_2_3_during_2_16(Start,End) :- globally_sense8_during_2_3(Start1,End1), (Start1-16)=<(End1-2), Start is (Start1-16), End is (End1-2), Start=<End.

finally_globally_sense8_during_2_3_during_2_16_at_2003(Res) :- setof((Start,End),finally_globally_sense8_during_2_3_during_2_16(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = finally_globally_sense8_during_2_3_during_2_16_at_2003'), (finally_globally_sense8_during_2_3_during_2_16_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

