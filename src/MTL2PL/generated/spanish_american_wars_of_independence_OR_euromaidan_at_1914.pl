:- include('database.pl').
spanish_american_wars_of_independence(Start,End) :- begin('spanish_american_wars_of_independence',_,_,Start), end('spanish_american_wars_of_independence',_,_,End), Start=<End.

euromaidan(Start,End) :- begin('euromaidan',_,_,Start), end('euromaidan',_,_,End), Start=<End.

generate_facts_spanish_american_wars_of_independence_OR_euromaidan([]) :- assert(spanish_american_wars_of_independence_OR_euromaidan(-1,-1)).

generate_facts_spanish_american_wars_of_independence_OR_euromaidan([(Start,End) | Tail]) :- assert(spanish_american_wars_of_independence_OR_euromaidan(Start,End)), generate_facts_spanish_american_wars_of_independence_OR_euromaidan(Tail).

spanish_american_wars_of_independence_OR_euromaidan_aux() :- findall((Start,End),spanish_american_wars_of_independence(Start,End),Interval1), findall((Start,End),euromaidan(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_spanish_american_wars_of_independence_OR_euromaidan(Interval).

spanish_american_wars_of_independence_OR_euromaidan_at_1914(Res) :- setof((Start,End),spanish_american_wars_of_independence_OR_euromaidan(Start,End),AllINtervals), checkvalidity(1914,AllINtervals,Res).

check_query() :- write('Query = spanish_american_wars_of_independence_OR_euromaidan_at_1914'), (spanish_american_wars_of_independence_OR_euromaidan_at_1914(true) -> write('\nRes   = true');write('\nRes   = false')).
?- spanish_american_wars_of_independence_OR_euromaidan_aux().

