:- include('database.pl').
interwar_period(Start,End) :- begin('interwar_period',_,_,Start), end('interwar_period',_,_,End), Start=<End.

prohibition_in_the_united_states(Start,End) :- begin('prohibition_in_the_united_states',_,_,Start), end('prohibition_in_the_united_states',_,_,End), Start=<End.

generate_facts_interwar_period_AND_prohibition_in_the_united_states([]) :- assert(interwar_period_AND_prohibition_in_the_united_states(-1,-1)).

generate_facts_interwar_period_AND_prohibition_in_the_united_states([(Start,End) | Tail]) :- assert(interwar_period_AND_prohibition_in_the_united_states(Start,End)), generate_facts_interwar_period_AND_prohibition_in_the_united_states(Tail).

interwar_period_AND_prohibition_in_the_united_states_aux() :- findall((Start,End),interwar_period(Start,End),Interval1), findall((Start,End),prohibition_in_the_united_states(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_interwar_period_AND_prohibition_in_the_united_states(Interval).

interwar_period_AND_prohibition_in_the_united_states_at_1914(Res) :- setof((Start,End),interwar_period_AND_prohibition_in_the_united_states(Start,End),AllINtervals), checkvalidity(1914,AllINtervals,Res).

check_query() :- write('Query = interwar_period_AND_prohibition_in_the_united_states_at_1914'), (interwar_period_AND_prohibition_in_the_united_states_at_1914(true) -> write('\nRes   = true');write('\nRes   = false')).
?- interwar_period_AND_prohibition_in_the_united_states_aux().

