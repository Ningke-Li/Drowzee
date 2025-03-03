:- include('database.pl').
edo_period(Start,End) :- begin('edo_period',_,_,Start), end('edo_period',_,_,End), Start=<End.

dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

generate_facts_edo_period_AND_dutch_guilder([]) :- assert(edo_period_AND_dutch_guilder(-1,-1)).

generate_facts_edo_period_AND_dutch_guilder([(Start,End) | Tail]) :- assert(edo_period_AND_dutch_guilder(Start,End)), generate_facts_edo_period_AND_dutch_guilder(Tail).

edo_period_AND_dutch_guilder_aux() :- findall((Start,End),edo_period(Start,End),Interval1), findall((Start,End),dutch_guilder(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_edo_period_AND_dutch_guilder(Interval).

edo_period_AND_dutch_guilder_at_1813(Res) :- setof((Start,End),edo_period_AND_dutch_guilder(Start,End),AllINtervals), checkvalidity(1813,AllINtervals,Res).

check_query() :- write('Query = edo_period_AND_dutch_guilder_at_1813'), (edo_period_AND_dutch_guilder_at_1813(true) -> write('\nRes   = true');write('\nRes   = false')).
?- edo_period_AND_dutch_guilder_aux().

