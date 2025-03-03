:- include('database.pl').
under_the_dome(Start,End) :- begin('under_the_dome',_,_,Start), end('under_the_dome',_,_,End), Start=<End.

bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

generate_facts_under_the_dome_AND_bones([]) :- assert(under_the_dome_AND_bones(-1,-1)).

generate_facts_under_the_dome_AND_bones([(Start,End) | Tail]) :- assert(under_the_dome_AND_bones(Start,End)), generate_facts_under_the_dome_AND_bones(Tail).

under_the_dome_AND_bones_aux() :- findall((Start,End),under_the_dome(Start,End),Interval1), findall((Start,End),bones(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_under_the_dome_AND_bones(Interval).

under_the_dome_AND_bones_at_1988(Res) :- setof((Start,End),under_the_dome_AND_bones(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = under_the_dome_AND_bones_at_1988'), (under_the_dome_AND_bones_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).
?- under_the_dome_AND_bones_aux().

