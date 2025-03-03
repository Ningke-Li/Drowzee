:- include('database.pl').
belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

prohibition_in_the_united_states(Start,End) :- begin('prohibition_in_the_united_states',_,_,Start), end('prohibition_in_the_united_states',_,_,End), Start=<End.

generate_facts_belgian_franc_AND_prohibition_in_the_united_states([]) :- assert(belgian_franc_AND_prohibition_in_the_united_states(-1,-1)).

generate_facts_belgian_franc_AND_prohibition_in_the_united_states([(Start,End) | Tail]) :- assert(belgian_franc_AND_prohibition_in_the_united_states(Start,End)), generate_facts_belgian_franc_AND_prohibition_in_the_united_states(Tail).

belgian_franc_AND_prohibition_in_the_united_states_aux() :- findall((Start,End),belgian_franc(Start,End),Interval1), findall((Start,End),prohibition_in_the_united_states(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_belgian_franc_AND_prohibition_in_the_united_states(Interval).

belgian_franc_AND_prohibition_in_the_united_states_at_1960(Res) :- setof((Start,End),belgian_franc_AND_prohibition_in_the_united_states(Start,End),AllINtervals), checkvalidity(1960,AllINtervals,Res).

check_query() :- write('Query = belgian_franc_AND_prohibition_in_the_united_states_at_1960'), (belgian_franc_AND_prohibition_in_the_united_states_at_1960(true) -> write('\nRes   = true');write('\nRes   = false')).
?- belgian_franc_AND_prohibition_in_the_united_states_aux().

