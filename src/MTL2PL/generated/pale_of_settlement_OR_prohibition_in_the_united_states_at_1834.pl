:- include('database.pl').
pale_of_settlement(Start,End) :- begin('pale_of_settlement',_,_,Start), end('pale_of_settlement',_,_,End), Start=<End.

prohibition_in_the_united_states(Start,End) :- begin('prohibition_in_the_united_states',_,_,Start), end('prohibition_in_the_united_states',_,_,End), Start=<End.

generate_facts_pale_of_settlement_OR_prohibition_in_the_united_states([]) :- assert(pale_of_settlement_OR_prohibition_in_the_united_states(-1,-1)).

generate_facts_pale_of_settlement_OR_prohibition_in_the_united_states([(Start,End) | Tail]) :- assert(pale_of_settlement_OR_prohibition_in_the_united_states(Start,End)), generate_facts_pale_of_settlement_OR_prohibition_in_the_united_states(Tail).

pale_of_settlement_OR_prohibition_in_the_united_states_aux() :- findall((Start,End),pale_of_settlement(Start,End),Interval1), findall((Start,End),prohibition_in_the_united_states(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_pale_of_settlement_OR_prohibition_in_the_united_states(Interval).

pale_of_settlement_OR_prohibition_in_the_united_states_at_1834(Res) :- setof((Start,End),pale_of_settlement_OR_prohibition_in_the_united_states(Start,End),AllINtervals), checkvalidity(1834,AllINtervals,Res).

check_query() :- write('Query = pale_of_settlement_OR_prohibition_in_the_united_states_at_1834'), (pale_of_settlement_OR_prohibition_in_the_united_states_at_1834(true) -> write('\nRes   = true');write('\nRes   = false')).
?- pale_of_settlement_OR_prohibition_in_the_united_states_aux().

