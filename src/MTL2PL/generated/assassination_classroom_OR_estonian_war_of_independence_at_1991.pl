:- include('database.pl').
assassination_classroom(Start,End) :- begin('assassination_classroom',_,_,Start), end('assassination_classroom',_,_,End), Start=<End.

estonian_war_of_independence(Start,End) :- begin('estonian_war_of_independence',_,_,Start), end('estonian_war_of_independence',_,_,End), Start=<End.

generate_facts_assassination_classroom_OR_estonian_war_of_independence([]) :- assert(assassination_classroom_OR_estonian_war_of_independence(-1,-1)).

generate_facts_assassination_classroom_OR_estonian_war_of_independence([(Start,End) | Tail]) :- assert(assassination_classroom_OR_estonian_war_of_independence(Start,End)), generate_facts_assassination_classroom_OR_estonian_war_of_independence(Tail).

assassination_classroom_OR_estonian_war_of_independence_aux() :- findall((Start,End),assassination_classroom(Start,End),Interval1), findall((Start,End),estonian_war_of_independence(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_assassination_classroom_OR_estonian_war_of_independence(Interval).

assassination_classroom_OR_estonian_war_of_independence_at_1991(Res) :- setof((Start,End),assassination_classroom_OR_estonian_war_of_independence(Start,End),AllINtervals), checkvalidity(1991,AllINtervals,Res).

check_query() :- write('Query = assassination_classroom_OR_estonian_war_of_independence_at_1991'), (assassination_classroom_OR_estonian_war_of_independence_at_1991(true) -> write('\nRes   = true');write('\nRes   = false')).
?- assassination_classroom_OR_estonian_war_of_independence_aux().

