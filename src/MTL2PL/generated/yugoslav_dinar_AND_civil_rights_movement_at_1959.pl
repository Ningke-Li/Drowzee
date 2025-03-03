:- include('database.pl').
yugoslav_dinar(Start,End) :- begin('yugoslav_dinar',_,_,Start), end('yugoslav_dinar',_,_,End), Start=<End.

civil_rights_movement(Start,End) :- begin('civil_rights_movement',_,_,Start), end('civil_rights_movement',_,_,End), Start=<End.

generate_facts_yugoslav_dinar_AND_civil_rights_movement([]) :- assert(yugoslav_dinar_AND_civil_rights_movement(-1,-1)).

generate_facts_yugoslav_dinar_AND_civil_rights_movement([(Start,End) | Tail]) :- assert(yugoslav_dinar_AND_civil_rights_movement(Start,End)), generate_facts_yugoslav_dinar_AND_civil_rights_movement(Tail).

yugoslav_dinar_AND_civil_rights_movement_aux() :- findall((Start,End),yugoslav_dinar(Start,End),Interval1), findall((Start,End),civil_rights_movement(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_yugoslav_dinar_AND_civil_rights_movement(Interval).

yugoslav_dinar_AND_civil_rights_movement_at_1959(Res) :- setof((Start,End),yugoslav_dinar_AND_civil_rights_movement(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = yugoslav_dinar_AND_civil_rights_movement_at_1959'), (yugoslav_dinar_AND_civil_rights_movement_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).
?- yugoslav_dinar_AND_civil_rights_movement_aux().

