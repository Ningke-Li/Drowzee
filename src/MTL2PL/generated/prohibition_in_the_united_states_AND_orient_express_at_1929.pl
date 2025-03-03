:- include('database.pl').
prohibition_in_the_united_states(Start,End) :- begin('prohibition_in_the_united_states',_,_,Start), end('prohibition_in_the_united_states',_,_,End), Start=<End.

orient_express(Start,End) :- begin('orient_express',_,_,Start), end('orient_express',_,_,End), Start=<End.

generate_facts_prohibition_in_the_united_states_AND_orient_express([]) :- assert(prohibition_in_the_united_states_AND_orient_express(-1,-1)).

generate_facts_prohibition_in_the_united_states_AND_orient_express([(Start,End) | Tail]) :- assert(prohibition_in_the_united_states_AND_orient_express(Start,End)), generate_facts_prohibition_in_the_united_states_AND_orient_express(Tail).

prohibition_in_the_united_states_AND_orient_express_aux() :- findall((Start,End),prohibition_in_the_united_states(Start,End),Interval1), findall((Start,End),orient_express(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_prohibition_in_the_united_states_AND_orient_express(Interval).

prohibition_in_the_united_states_AND_orient_express_at_1929(Res) :- setof((Start,End),prohibition_in_the_united_states_AND_orient_express(Start,End),AllINtervals), checkvalidity(1929,AllINtervals,Res).

check_query() :- write('Query = prohibition_in_the_united_states_AND_orient_express_at_1929'), (prohibition_in_the_united_states_AND_orient_express_at_1929(true) -> write('\nRes   = true');write('\nRes   = false')).
?- prohibition_in_the_united_states_AND_orient_express_aux().

