:- include('database.pl').
assassination_classroom(Start,End) :- begin('assassination_classroom',_,_,Start), end('assassination_classroom',_,_,End), Start=<End.

narcos(Start,End) :- begin('narcos',_,_,Start), end('narcos',_,_,End), Start=<End.

generate_facts_assassination_classroom_AND_narcos([]) :- assert(assassination_classroom_AND_narcos(-1,-1)).

generate_facts_assassination_classroom_AND_narcos([(Start,End) | Tail]) :- assert(assassination_classroom_AND_narcos(Start,End)), generate_facts_assassination_classroom_AND_narcos(Tail).

assassination_classroom_AND_narcos_aux() :- findall((Start,End),assassination_classroom(Start,End),Interval1), findall((Start,End),narcos(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_assassination_classroom_AND_narcos(Interval).

assassination_classroom_AND_narcos_at_1926(Res) :- setof((Start,End),assassination_classroom_AND_narcos(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = assassination_classroom_AND_narcos_at_1926'), (assassination_classroom_AND_narcos_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).
?- assassination_classroom_AND_narcos_aux().

