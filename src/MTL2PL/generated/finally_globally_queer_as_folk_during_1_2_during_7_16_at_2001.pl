:- include('database.pl').
queer_as_folk(Start,End) :- begin('queer_as_folk',_,_,Start), end('queer_as_folk',_,_,End), Start=<End.

globally_queer_as_folk_during_1_2(Start,End) :- queer_as_folk(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

finally_globally_queer_as_folk_during_1_2_during_7_16(Start,End) :- globally_queer_as_folk_during_1_2(Start1,End1), (Start1-16)=<(End1-7), Start is (Start1-16), End is (End1-7), Start=<End.

finally_globally_queer_as_folk_during_1_2_during_7_16_at_2001(Res) :- setof((Start,End),finally_globally_queer_as_folk_during_1_2_during_7_16(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = finally_globally_queer_as_folk_during_1_2_during_7_16_at_2001'), (finally_globally_queer_as_folk_during_1_2_during_7_16_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

