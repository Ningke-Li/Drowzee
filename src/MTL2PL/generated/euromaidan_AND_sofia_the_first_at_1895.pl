:- include('database.pl').
euromaidan(Start,End) :- begin('euromaidan',_,_,Start), end('euromaidan',_,_,End), Start=<End.

sofia_the_first(Start,End) :- begin('sofia_the_first',_,_,Start), end('sofia_the_first',_,_,End), Start=<End.

generate_facts_euromaidan_AND_sofia_the_first([]) :- assert(euromaidan_AND_sofia_the_first(-1,-1)).

generate_facts_euromaidan_AND_sofia_the_first([(Start,End) | Tail]) :- assert(euromaidan_AND_sofia_the_first(Start,End)), generate_facts_euromaidan_AND_sofia_the_first(Tail).

euromaidan_AND_sofia_the_first_aux() :- findall((Start,End),euromaidan(Start,End),Interval1), findall((Start,End),sofia_the_first(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_euromaidan_AND_sofia_the_first(Interval).

euromaidan_AND_sofia_the_first_at_1895(Res) :- setof((Start,End),euromaidan_AND_sofia_the_first(Start,End),AllINtervals), checkvalidity(1895,AllINtervals,Res).

check_query() :- write('Query = euromaidan_AND_sofia_the_first_at_1895'), (euromaidan_AND_sofia_the_first_at_1895(true) -> write('\nRes   = true');write('\nRes   = false')).
?- euromaidan_AND_sofia_the_first_aux().

