:- include('database.pl').
operation_uranus(Start,End) :- begin('operation_uranus',_,_,Start), end('operation_uranus',_,_,End), Start=<End.

vistula_oder_offensive(Start,End) :- begin('vistula_oder_offensive',_,_,Start), end('vistula_oder_offensive',_,_,End), Start=<End.

generate_facts_operation_uranus_OR_vistula_oder_offensive([]) :- assert(operation_uranus_OR_vistula_oder_offensive(-1,-1)).

generate_facts_operation_uranus_OR_vistula_oder_offensive([(Start,End) | Tail]) :- assert(operation_uranus_OR_vistula_oder_offensive(Start,End)), generate_facts_operation_uranus_OR_vistula_oder_offensive(Tail).

operation_uranus_OR_vistula_oder_offensive_aux() :- findall((Start,End),operation_uranus(Start,End),Interval1), findall((Start,End),vistula_oder_offensive(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_operation_uranus_OR_vistula_oder_offensive(Interval).

operation_uranus_OR_vistula_oder_offensive_at_1933(Res) :- setof((Start,End),operation_uranus_OR_vistula_oder_offensive(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = operation_uranus_OR_vistula_oder_offensive_at_1933'), (operation_uranus_OR_vistula_oder_offensive_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_uranus_OR_vistula_oder_offensive_aux().

