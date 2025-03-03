:- include('database.pl').
estonian_kroon(Start,End) :- begin('estonian_kroon',_,_,Start), end('estonian_kroon',_,_,End), Start=<End.

the_adventures_of_jimmy_neutron__boy_genius(Start,End) :- begin('the_adventures_of_jimmy_neutron__boy_genius',_,_,Start), end('the_adventures_of_jimmy_neutron__boy_genius',_,_,End), Start=<End.

generate_facts_estonian_kroon_AND_the_adventures_of_jimmy_neutron__boy_genius([]) :- assert(estonian_kroon_AND_the_adventures_of_jimmy_neutron__boy_genius(-1,-1)).

generate_facts_estonian_kroon_AND_the_adventures_of_jimmy_neutron__boy_genius([(Start,End) | Tail]) :- assert(estonian_kroon_AND_the_adventures_of_jimmy_neutron__boy_genius(Start,End)), generate_facts_estonian_kroon_AND_the_adventures_of_jimmy_neutron__boy_genius(Tail).

estonian_kroon_AND_the_adventures_of_jimmy_neutron__boy_genius_aux() :- findall((Start,End),estonian_kroon(Start,End),Interval1), findall((Start,End),the_adventures_of_jimmy_neutron__boy_genius(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_estonian_kroon_AND_the_adventures_of_jimmy_neutron__boy_genius(Interval).

estonian_kroon_AND_the_adventures_of_jimmy_neutron__boy_genius_at_2005(Res) :- setof((Start,End),estonian_kroon_AND_the_adventures_of_jimmy_neutron__boy_genius(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = estonian_kroon_AND_the_adventures_of_jimmy_neutron__boy_genius_at_2005'), (estonian_kroon_AND_the_adventures_of_jimmy_neutron__boy_genius_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- estonian_kroon_AND_the_adventures_of_jimmy_neutron__boy_genius_aux().

