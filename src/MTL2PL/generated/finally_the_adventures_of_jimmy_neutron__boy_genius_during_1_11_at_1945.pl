:- include('database.pl').
the_adventures_of_jimmy_neutron__boy_genius(Start,End) :- begin('the_adventures_of_jimmy_neutron__boy_genius',_,_,Start), end('the_adventures_of_jimmy_neutron__boy_genius',_,_,End), Start=<End.

finally_the_adventures_of_jimmy_neutron__boy_genius_during_1_11(Start,End) :- the_adventures_of_jimmy_neutron__boy_genius(Start1,End1), (Start1-11)=<(End1-1), Start is (Start1-11), End is (End1-1), Start=<End.

finally_the_adventures_of_jimmy_neutron__boy_genius_during_1_11_at_1945(Res) :- setof((Start,End),finally_the_adventures_of_jimmy_neutron__boy_genius_during_1_11(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = finally_the_adventures_of_jimmy_neutron__boy_genius_during_1_11_at_1945'), (finally_the_adventures_of_jimmy_neutron__boy_genius_during_1_11_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).

