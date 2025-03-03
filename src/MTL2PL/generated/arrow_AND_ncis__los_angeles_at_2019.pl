:- include('database.pl').
arrow(Start,End) :- begin('arrow',_,_,Start), end('arrow',_,_,End), Start=<End.

ncis__los_angeles(Start,End) :- begin('ncis__los_angeles',_,_,Start), end('ncis__los_angeles',_,_,End), Start=<End.

generate_facts_arrow_AND_ncis__los_angeles([]) :- assert(arrow_AND_ncis__los_angeles(-1,-1)).

generate_facts_arrow_AND_ncis__los_angeles([(Start,End) | Tail]) :- assert(arrow_AND_ncis__los_angeles(Start,End)), generate_facts_arrow_AND_ncis__los_angeles(Tail).

arrow_AND_ncis__los_angeles_aux() :- findall((Start,End),arrow(Start,End),Interval1), findall((Start,End),ncis__los_angeles(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_arrow_AND_ncis__los_angeles(Interval).

arrow_AND_ncis__los_angeles_at_2019(Res) :- setof((Start,End),arrow_AND_ncis__los_angeles(Start,End),AllINtervals), checkvalidity(2019,AllINtervals,Res).

check_query() :- write('Query = arrow_AND_ncis__los_angeles_at_2019'), (arrow_AND_ncis__los_angeles_at_2019(true) -> write('\nRes   = true');write('\nRes   = false')).
?- arrow_AND_ncis__los_angeles_aux().

