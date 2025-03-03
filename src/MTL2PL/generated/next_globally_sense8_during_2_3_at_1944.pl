:- include('database.pl').
sense8(Start,End) :- begin('sense8',_,_,Start), end('sense8',_,_,End), Start=<End.

globally_sense8_during_2_3(Start,End) :- sense8(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

next_globally_sense8_during_2_3(Start,End) :- globally_sense8_during_2_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_sense8_during_2_3_at_1944(Res) :- setof((Start,End),next_globally_sense8_during_2_3(Start,End),AllINtervals), checkvalidity(1944,AllINtervals,Res).

check_query() :- write('Query = next_globally_sense8_during_2_3_at_1944'), (next_globally_sense8_during_2_3_at_1944(true) -> write('\nRes   = true');write('\nRes   = false')).

