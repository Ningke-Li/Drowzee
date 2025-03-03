:- include('database.pl').
the_adventures_of_jimmy_neutron__boy_genius(Start,End) :- begin('the_adventures_of_jimmy_neutron__boy_genius',_,_,Start), end('the_adventures_of_jimmy_neutron__boy_genius',_,_,End), Start=<End.

rome(Start,End) :- begin('rome',_,_,Start), end('rome',_,_,End), Start=<End.

the_adventures_of_jimmy_neutron__boy_genius_last_till_1_9(Start,End) :- the_adventures_of_jimmy_neutron__boy_genius(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

the_adventures_of_jimmy_neutron__boy_genius_until_rome_during_1_9_overlap(Start,End) :- the_adventures_of_jimmy_neutron__boy_genius_last_till_1_9(Start1,End1), rome(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_adventures_of_jimmy_neutron__boy_genius_until_rome_during_1_9(Start,End) :- the_adventures_of_jimmy_neutron__boy_genius(W1,_), the_adventures_of_jimmy_neutron__boy_genius_until_rome_during_1_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-1), Start=<End.

the_adventures_of_jimmy_neutron__boy_genius_until_rome_during_1_9_at_1881(Res) :- setof((Start,End),the_adventures_of_jimmy_neutron__boy_genius_until_rome_during_1_9(Start,End),AllINtervals), checkvalidity(1881,AllINtervals,Res).

check_query() :- write('Query = the_adventures_of_jimmy_neutron__boy_genius_until_rome_during_1_9_at_1881'), (the_adventures_of_jimmy_neutron__boy_genius_until_rome_during_1_9_at_1881(true) -> write('\nRes   = true');write('\nRes   = false')).

