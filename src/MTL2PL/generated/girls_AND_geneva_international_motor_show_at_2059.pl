:- include('database.pl').
girls(Start,End) :- begin('girls',_,_,Start), end('girls',_,_,End), Start=<End.

geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

generate_facts_girls_AND_geneva_international_motor_show([]) :- assert(girls_AND_geneva_international_motor_show(-1,-1)).

generate_facts_girls_AND_geneva_international_motor_show([(Start,End) | Tail]) :- assert(girls_AND_geneva_international_motor_show(Start,End)), generate_facts_girls_AND_geneva_international_motor_show(Tail).

girls_AND_geneva_international_motor_show_aux() :- findall((Start,End),girls(Start,End),Interval1), findall((Start,End),geneva_international_motor_show(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_girls_AND_geneva_international_motor_show(Interval).

girls_AND_geneva_international_motor_show_at_2059(Res) :- setof((Start,End),girls_AND_geneva_international_motor_show(Start,End),AllINtervals), checkvalidity(2059,AllINtervals,Res).

check_query() :- write('Query = girls_AND_geneva_international_motor_show_at_2059'), (girls_AND_geneva_international_motor_show_at_2059(true) -> write('\nRes   = true');write('\nRes   = false')).
?- girls_AND_geneva_international_motor_show_aux().

