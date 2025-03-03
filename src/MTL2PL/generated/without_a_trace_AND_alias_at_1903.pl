:- include('database.pl').
without_a_trace(Start,End) :- begin('without_a_trace',_,_,Start), end('without_a_trace',_,_,End), Start=<End.

alias(Start,End) :- begin('alias',_,_,Start), end('alias',_,_,End), Start=<End.

generate_facts_without_a_trace_AND_alias([]) :- assert(without_a_trace_AND_alias(-1,-1)).

generate_facts_without_a_trace_AND_alias([(Start,End) | Tail]) :- assert(without_a_trace_AND_alias(Start,End)), generate_facts_without_a_trace_AND_alias(Tail).

without_a_trace_AND_alias_aux() :- findall((Start,End),without_a_trace(Start,End),Interval1), findall((Start,End),alias(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_without_a_trace_AND_alias(Interval).

without_a_trace_AND_alias_at_1903(Res) :- setof((Start,End),without_a_trace_AND_alias(Start,End),AllINtervals), checkvalidity(1903,AllINtervals,Res).

check_query() :- write('Query = without_a_trace_AND_alias_at_1903'), (without_a_trace_AND_alias_at_1903(true) -> write('\nRes   = true');write('\nRes   = false')).
?- without_a_trace_AND_alias_aux().

