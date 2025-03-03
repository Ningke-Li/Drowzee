:- include('database.pl').
enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

generate_facts_enabling_act_of_1933_OR_world_heavyweight_championship_rey_mysterio([]) :- assert(enabling_act_of_1933_OR_world_heavyweight_championship_rey_mysterio(-1,-1)).

generate_facts_enabling_act_of_1933_OR_world_heavyweight_championship_rey_mysterio([(Start,End) | Tail]) :- assert(enabling_act_of_1933_OR_world_heavyweight_championship_rey_mysterio(Start,End)), generate_facts_enabling_act_of_1933_OR_world_heavyweight_championship_rey_mysterio(Tail).

enabling_act_of_1933_OR_world_heavyweight_championship_rey_mysterio_aux() :- findall((Start,End),enabling_act_of_1933(Start,End),Interval1), findall((Start,End),world_heavyweight_championship_rey_mysterio(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_enabling_act_of_1933_OR_world_heavyweight_championship_rey_mysterio(Interval).

enabling_act_of_1933_OR_world_heavyweight_championship_rey_mysterio_at_1798(Res) :- setof((Start,End),enabling_act_of_1933_OR_world_heavyweight_championship_rey_mysterio(Start,End),AllINtervals), checkvalidity(1798,AllINtervals,Res).

check_query() :- write('Query = enabling_act_of_1933_OR_world_heavyweight_championship_rey_mysterio_at_1798'), (enabling_act_of_1933_OR_world_heavyweight_championship_rey_mysterio_at_1798(true) -> write('\nRes   = true');write('\nRes   = false')).
?- enabling_act_of_1933_OR_world_heavyweight_championship_rey_mysterio_aux().

