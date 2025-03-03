:- include('database.pl').
civil_rights_movement(Start,End) :- begin('civil_rights_movement',_,_,Start), end('civil_rights_movement',_,_,End), Start=<End.

ev_1950s(Start,End) :- begin('ev_1950s',_,_,Start), end('ev_1950s',_,_,End), Start=<End.

generate_facts_civil_rights_movement_AND_ev_1950s([]) :- assert(civil_rights_movement_AND_ev_1950s(-1,-1)).

generate_facts_civil_rights_movement_AND_ev_1950s([(Start,End) | Tail]) :- assert(civil_rights_movement_AND_ev_1950s(Start,End)), generate_facts_civil_rights_movement_AND_ev_1950s(Tail).

civil_rights_movement_AND_ev_1950s_aux() :- findall((Start,End),civil_rights_movement(Start,End),Interval1), findall((Start,End),ev_1950s(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_civil_rights_movement_AND_ev_1950s(Interval).

civil_rights_movement_AND_ev_1950s_at_1957(Res) :- setof((Start,End),civil_rights_movement_AND_ev_1950s(Start,End),AllINtervals), checkvalidity(1957,AllINtervals,Res).

check_query() :- write('Query = civil_rights_movement_AND_ev_1950s_at_1957'), (civil_rights_movement_AND_ev_1950s_at_1957(true) -> write('\nRes   = true');write('\nRes   = false')).
?- civil_rights_movement_AND_ev_1950s_aux().

