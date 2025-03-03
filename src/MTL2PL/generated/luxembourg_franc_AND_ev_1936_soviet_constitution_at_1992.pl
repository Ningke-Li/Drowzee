:- include('database.pl').
luxembourg_franc(Start,End) :- begin('luxembourg_franc',_,_,Start), end('luxembourg_franc',_,_,End), Start=<End.

ev_1936_soviet_constitution(Start,End) :- begin('ev_1936_soviet_constitution',_,_,Start), end('ev_1936_soviet_constitution',_,_,End), Start=<End.

generate_facts_luxembourg_franc_AND_ev_1936_soviet_constitution([]) :- assert(luxembourg_franc_AND_ev_1936_soviet_constitution(-1,-1)).

generate_facts_luxembourg_franc_AND_ev_1936_soviet_constitution([(Start,End) | Tail]) :- assert(luxembourg_franc_AND_ev_1936_soviet_constitution(Start,End)), generate_facts_luxembourg_franc_AND_ev_1936_soviet_constitution(Tail).

luxembourg_franc_AND_ev_1936_soviet_constitution_aux() :- findall((Start,End),luxembourg_franc(Start,End),Interval1), findall((Start,End),ev_1936_soviet_constitution(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_luxembourg_franc_AND_ev_1936_soviet_constitution(Interval).

luxembourg_franc_AND_ev_1936_soviet_constitution_at_1992(Res) :- setof((Start,End),luxembourg_franc_AND_ev_1936_soviet_constitution(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = luxembourg_franc_AND_ev_1936_soviet_constitution_at_1992'), (luxembourg_franc_AND_ev_1936_soviet_constitution_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).
?- luxembourg_franc_AND_ev_1936_soviet_constitution_aux().

