:- include('database.pl').
the_wire(Start,End) :- begin('the_wire',_,_,Start), end('the_wire',_,_,End), Start=<End.

globally_the_wire_during_1_3(Start,End) :- the_wire(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_the_wire_during_1_3_at_2028(Res) :- setof((Start,End),globally_the_wire_during_1_3(Start,End),AllINtervals), checkvalidity(2028,AllINtervals,Res).

check_query() :- write('Query = globally_the_wire_during_1_3_at_2028'), (globally_the_wire_during_1_3_at_2028(true) -> write('\nRes   = true');write('\nRes   = false')).

