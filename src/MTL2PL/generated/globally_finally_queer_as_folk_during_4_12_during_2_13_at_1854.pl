:- include('database.pl').
queer_as_folk(Start,End) :- begin('queer_as_folk',_,_,Start), end('queer_as_folk',_,_,End), Start=<End.

finally_queer_as_folk_during_4_12(Start,End) :- queer_as_folk(Start1,End1), (Start1-12)=<(End1-4), Start is (Start1-12), End is (End1-4), Start=<End.

globally_finally_queer_as_folk_during_4_12_during_2_13(Start,End) :- finally_queer_as_folk_during_4_12(Start1,End1), Start is (Start1-2), End is (End1-13), Start=<End.

globally_finally_queer_as_folk_during_4_12_during_2_13_at_1854(Res) :- setof((Start,End),globally_finally_queer_as_folk_during_4_12_during_2_13(Start,End),AllINtervals), checkvalidity(1854,AllINtervals,Res).

check_query() :- write('Query = globally_finally_queer_as_folk_during_4_12_during_2_13_at_1854'), (globally_finally_queer_as_folk_during_4_12_during_2_13_at_1854(true) -> write('\nRes   = true');write('\nRes   = false')).

