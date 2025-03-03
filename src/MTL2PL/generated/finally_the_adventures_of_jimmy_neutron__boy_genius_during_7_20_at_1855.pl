:- include('database.pl').
the_adventures_of_jimmy_neutron__boy_genius(Start,End) :- begin('the_adventures_of_jimmy_neutron__boy_genius',_,_,Start), end('the_adventures_of_jimmy_neutron__boy_genius',_,_,End), Start=<End.

finally_the_adventures_of_jimmy_neutron__boy_genius_during_7_20(Start,End) :- the_adventures_of_jimmy_neutron__boy_genius(Start1,End1), (Start1-20)=<(End1-7), Start is (Start1-20), End is (End1-7), Start=<End.

finally_the_adventures_of_jimmy_neutron__boy_genius_during_7_20_at_1855(Res) :- setof((Start,End),finally_the_adventures_of_jimmy_neutron__boy_genius_during_7_20(Start,End),AllINtervals), checkvalidity(1855,AllINtervals,Res).

check_query() :- write('Query = finally_the_adventures_of_jimmy_neutron__boy_genius_during_7_20_at_1855'), (finally_the_adventures_of_jimmy_neutron__boy_genius_during_7_20_at_1855(true) -> write('\nRes   = true');write('\nRes   = false')).

