:- include('database.pl').
enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

civil_rights_movement(Start,End) :- begin('civil_rights_movement',_,_,Start), end('civil_rights_movement',_,_,End), Start=<End.

generate_facts_enabling_act_of_1933_OR_civil_rights_movement([]) :- assert(enabling_act_of_1933_OR_civil_rights_movement(-1,-1)).

generate_facts_enabling_act_of_1933_OR_civil_rights_movement([(Start,End) | Tail]) :- assert(enabling_act_of_1933_OR_civil_rights_movement(Start,End)), generate_facts_enabling_act_of_1933_OR_civil_rights_movement(Tail).

enabling_act_of_1933_OR_civil_rights_movement_aux() :- findall((Start,End),enabling_act_of_1933(Start,End),Interval1), findall((Start,End),civil_rights_movement(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_enabling_act_of_1933_OR_civil_rights_movement(Interval).

enabling_act_of_1933_OR_civil_rights_movement_at_1939(Res) :- setof((Start,End),enabling_act_of_1933_OR_civil_rights_movement(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = enabling_act_of_1933_OR_civil_rights_movement_at_1939'), (enabling_act_of_1933_OR_civil_rights_movement_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).
?- enabling_act_of_1933_OR_civil_rights_movement_aux().

