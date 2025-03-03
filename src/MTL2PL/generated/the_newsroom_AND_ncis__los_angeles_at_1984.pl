:- include('database.pl').
the_newsroom(Start,End) :- begin('the_newsroom',_,_,Start), end('the_newsroom',_,_,End), Start=<End.

ncis__los_angeles(Start,End) :- begin('ncis__los_angeles',_,_,Start), end('ncis__los_angeles',_,_,End), Start=<End.

generate_facts_the_newsroom_AND_ncis__los_angeles([]) :- assert(the_newsroom_AND_ncis__los_angeles(-1,-1)).

generate_facts_the_newsroom_AND_ncis__los_angeles([(Start,End) | Tail]) :- assert(the_newsroom_AND_ncis__los_angeles(Start,End)), generate_facts_the_newsroom_AND_ncis__los_angeles(Tail).

the_newsroom_AND_ncis__los_angeles_aux() :- findall((Start,End),the_newsroom(Start,End),Interval1), findall((Start,End),ncis__los_angeles(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_newsroom_AND_ncis__los_angeles(Interval).

the_newsroom_AND_ncis__los_angeles_at_1984(Res) :- setof((Start,End),the_newsroom_AND_ncis__los_angeles(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = the_newsroom_AND_ncis__los_angeles_at_1984'), (the_newsroom_AND_ncis__los_angeles_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_newsroom_AND_ncis__los_angeles_aux().

