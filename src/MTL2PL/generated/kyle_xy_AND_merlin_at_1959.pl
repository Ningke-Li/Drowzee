:- include('database.pl').
kyle_xy(Start,End) :- begin('kyle_xy',_,_,Start), end('kyle_xy',_,_,End), Start=<End.

merlin(Start,End) :- begin('merlin',_,_,Start), end('merlin',_,_,End), Start=<End.

generate_facts_kyle_xy_AND_merlin([]) :- assert(kyle_xy_AND_merlin(-1,-1)).

generate_facts_kyle_xy_AND_merlin([(Start,End) | Tail]) :- assert(kyle_xy_AND_merlin(Start,End)), generate_facts_kyle_xy_AND_merlin(Tail).

kyle_xy_AND_merlin_aux() :- findall((Start,End),kyle_xy(Start,End),Interval1), findall((Start,End),merlin(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_kyle_xy_AND_merlin(Interval).

kyle_xy_AND_merlin_at_1959(Res) :- setof((Start,End),kyle_xy_AND_merlin(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = kyle_xy_AND_merlin_at_1959'), (kyle_xy_AND_merlin_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).
?- kyle_xy_AND_merlin_aux().

