:- include('database.pl').
under_the_dome(Start,End) :- begin('under_the_dome',_,_,Start), end('under_the_dome',_,_,End), Start=<End.

fairy_tail(Start,End) :- begin('fairy_tail',_,_,Start), end('fairy_tail',_,_,End), Start=<End.

generate_facts_under_the_dome_AND_fairy_tail([]) :- assert(under_the_dome_AND_fairy_tail(-1,-1)).

generate_facts_under_the_dome_AND_fairy_tail([(Start,End) | Tail]) :- assert(under_the_dome_AND_fairy_tail(Start,End)), generate_facts_under_the_dome_AND_fairy_tail(Tail).

under_the_dome_AND_fairy_tail_aux() :- findall((Start,End),under_the_dome(Start,End),Interval1), findall((Start,End),fairy_tail(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_under_the_dome_AND_fairy_tail(Interval).

under_the_dome_AND_fairy_tail_at_2009(Res) :- setof((Start,End),under_the_dome_AND_fairy_tail(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = under_the_dome_AND_fairy_tail_at_2009'), (under_the_dome_AND_fairy_tail_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- under_the_dome_AND_fairy_tail_aux().

