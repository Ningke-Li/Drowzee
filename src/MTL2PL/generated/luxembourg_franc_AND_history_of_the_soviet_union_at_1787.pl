:- include('database.pl').
luxembourg_franc(Start,End) :- begin('luxembourg_franc',_,_,Start), end('luxembourg_franc',_,_,End), Start=<End.

history_of_the_soviet_union(Start,End) :- begin('history_of_the_soviet_union',_,_,Start), end('history_of_the_soviet_union',_,_,End), Start=<End.

generate_facts_luxembourg_franc_AND_history_of_the_soviet_union([]) :- assert(luxembourg_franc_AND_history_of_the_soviet_union(-1,-1)).

generate_facts_luxembourg_franc_AND_history_of_the_soviet_union([(Start,End) | Tail]) :- assert(luxembourg_franc_AND_history_of_the_soviet_union(Start,End)), generate_facts_luxembourg_franc_AND_history_of_the_soviet_union(Tail).

luxembourg_franc_AND_history_of_the_soviet_union_aux() :- findall((Start,End),luxembourg_franc(Start,End),Interval1), findall((Start,End),history_of_the_soviet_union(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_luxembourg_franc_AND_history_of_the_soviet_union(Interval).

luxembourg_franc_AND_history_of_the_soviet_union_at_1787(Res) :- setof((Start,End),luxembourg_franc_AND_history_of_the_soviet_union(Start,End),AllINtervals), checkvalidity(1787,AllINtervals,Res).

check_query() :- write('Query = luxembourg_franc_AND_history_of_the_soviet_union_at_1787'), (luxembourg_franc_AND_history_of_the_soviet_union_at_1787(true) -> write('\nRes   = true');write('\nRes   = false')).
?- luxembourg_franc_AND_history_of_the_soviet_union_aux().

