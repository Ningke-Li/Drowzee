:- include('database.pl').
true_blood(Start,End) :- begin('true_blood',_,_,Start), end('true_blood',_,_,End), Start=<End.

world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

generate_facts_true_blood_AND_world_heavyweight_championship_rey_mysterio([]) :- assert(true_blood_AND_world_heavyweight_championship_rey_mysterio(-1,-1)).

generate_facts_true_blood_AND_world_heavyweight_championship_rey_mysterio([(Start,End) | Tail]) :- assert(true_blood_AND_world_heavyweight_championship_rey_mysterio(Start,End)), generate_facts_true_blood_AND_world_heavyweight_championship_rey_mysterio(Tail).

true_blood_AND_world_heavyweight_championship_rey_mysterio_aux() :- findall((Start,End),true_blood(Start,End),Interval1), findall((Start,End),world_heavyweight_championship_rey_mysterio(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_true_blood_AND_world_heavyweight_championship_rey_mysterio(Interval).

true_blood_AND_world_heavyweight_championship_rey_mysterio_at_1872(Res) :- setof((Start,End),true_blood_AND_world_heavyweight_championship_rey_mysterio(Start,End),AllINtervals), checkvalidity(1872,AllINtervals,Res).

check_query() :- write('Query = true_blood_AND_world_heavyweight_championship_rey_mysterio_at_1872'), (true_blood_AND_world_heavyweight_championship_rey_mysterio_at_1872(true) -> write('\nRes   = true');write('\nRes   = false')).
?- true_blood_AND_world_heavyweight_championship_rey_mysterio_aux().

