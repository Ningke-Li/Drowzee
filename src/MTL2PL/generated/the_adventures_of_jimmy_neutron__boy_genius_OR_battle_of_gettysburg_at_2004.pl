:- include('database.pl').
the_adventures_of_jimmy_neutron__boy_genius(Start,End) :- begin('the_adventures_of_jimmy_neutron__boy_genius',_,_,Start), end('the_adventures_of_jimmy_neutron__boy_genius',_,_,End), Start=<End.

battle_of_gettysburg(Start,End) :- begin('battle_of_gettysburg',_,_,Start), end('battle_of_gettysburg',_,_,End), Start=<End.

generate_facts_the_adventures_of_jimmy_neutron__boy_genius_OR_battle_of_gettysburg([]) :- assert(the_adventures_of_jimmy_neutron__boy_genius_OR_battle_of_gettysburg(-1,-1)).

generate_facts_the_adventures_of_jimmy_neutron__boy_genius_OR_battle_of_gettysburg([(Start,End) | Tail]) :- assert(the_adventures_of_jimmy_neutron__boy_genius_OR_battle_of_gettysburg(Start,End)), generate_facts_the_adventures_of_jimmy_neutron__boy_genius_OR_battle_of_gettysburg(Tail).

the_adventures_of_jimmy_neutron__boy_genius_OR_battle_of_gettysburg_aux() :- findall((Start,End),the_adventures_of_jimmy_neutron__boy_genius(Start,End),Interval1), findall((Start,End),battle_of_gettysburg(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_adventures_of_jimmy_neutron__boy_genius_OR_battle_of_gettysburg(Interval).

the_adventures_of_jimmy_neutron__boy_genius_OR_battle_of_gettysburg_at_2004(Res) :- setof((Start,End),the_adventures_of_jimmy_neutron__boy_genius_OR_battle_of_gettysburg(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = the_adventures_of_jimmy_neutron__boy_genius_OR_battle_of_gettysburg_at_2004'), (the_adventures_of_jimmy_neutron__boy_genius_OR_battle_of_gettysburg_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_adventures_of_jimmy_neutron__boy_genius_OR_battle_of_gettysburg_aux().

