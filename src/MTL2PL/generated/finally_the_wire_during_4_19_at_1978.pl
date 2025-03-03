:- include('database.pl').
the_wire(Start,End) :- begin('the_wire',_,_,Start), end('the_wire',_,_,End), Start=<End.

finally_the_wire_during_4_19(Start,End) :- the_wire(Start1,End1), (Start1-19)=<(End1-4), Start is (Start1-19), End is (End1-4), Start=<End.

finally_the_wire_during_4_19_at_1978(Res) :- setof((Start,End),finally_the_wire_during_4_19(Start,End),AllINtervals), checkvalidity(1978,AllINtervals,Res).

check_query() :- write('Query = finally_the_wire_during_4_19_at_1978'), (finally_the_wire_during_4_19_at_1978(true) -> write('\nRes   = true');write('\nRes   = false')).

