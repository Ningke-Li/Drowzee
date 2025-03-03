:- include('database.pl').
queer_as_folk(Start,End) :- begin('queer_as_folk',_,_,Start), end('queer_as_folk',_,_,End), Start=<End.

finally_queer_as_folk_during_7_19(Start,End) :- queer_as_folk(Start1,End1), (Start1-19)=<(End1-7), Start is (Start1-19), End is (End1-7), Start=<End.

finally_queer_as_folk_during_7_19_at_1985(Res) :- setof((Start,End),finally_queer_as_folk_during_7_19(Start,End),AllINtervals), checkvalidity(1985,AllINtervals,Res).

check_query() :- write('Query = finally_queer_as_folk_during_7_19_at_1985'), (finally_queer_as_folk_during_7_19_at_1985(true) -> write('\nRes   = true');write('\nRes   = false')).

