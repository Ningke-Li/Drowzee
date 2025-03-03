:- include('database.pl').
prohibition_in_the_united_states(Start,End) :- begin('prohibition_in_the_united_states',_,_,Start), end('prohibition_in_the_united_states',_,_,End), Start=<End.

iron_fist(Start,End) :- begin('iron_fist',_,_,Start), end('iron_fist',_,_,End), Start=<End.

generate_facts_prohibition_in_the_united_states_OR_iron_fist([]) :- assert(prohibition_in_the_united_states_OR_iron_fist(-1,-1)).

generate_facts_prohibition_in_the_united_states_OR_iron_fist([(Start,End) | Tail]) :- assert(prohibition_in_the_united_states_OR_iron_fist(Start,End)), generate_facts_prohibition_in_the_united_states_OR_iron_fist(Tail).

prohibition_in_the_united_states_OR_iron_fist_aux() :- findall((Start,End),prohibition_in_the_united_states(Start,End),Interval1), findall((Start,End),iron_fist(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_prohibition_in_the_united_states_OR_iron_fist(Interval).

prohibition_in_the_united_states_OR_iron_fist_at_2010(Res) :- setof((Start,End),prohibition_in_the_united_states_OR_iron_fist(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = prohibition_in_the_united_states_OR_iron_fist_at_2010'), (prohibition_in_the_united_states_OR_iron_fist_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- prohibition_in_the_united_states_OR_iron_fist_aux().

