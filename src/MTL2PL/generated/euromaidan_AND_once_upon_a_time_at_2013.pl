:- include('database.pl').
euromaidan(Start,End) :- begin('euromaidan',_,_,Start), end('euromaidan',_,_,End), Start=<End.

once_upon_a_time(Start,End) :- begin('once_upon_a_time',_,_,Start), end('once_upon_a_time',_,_,End), Start=<End.

generate_facts_euromaidan_AND_once_upon_a_time([]) :- assert(euromaidan_AND_once_upon_a_time(-1,-1)).

generate_facts_euromaidan_AND_once_upon_a_time([(Start,End) | Tail]) :- assert(euromaidan_AND_once_upon_a_time(Start,End)), generate_facts_euromaidan_AND_once_upon_a_time(Tail).

euromaidan_AND_once_upon_a_time_aux() :- findall((Start,End),euromaidan(Start,End),Interval1), findall((Start,End),once_upon_a_time(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_euromaidan_AND_once_upon_a_time(Interval).

euromaidan_AND_once_upon_a_time_at_2013(Res) :- setof((Start,End),euromaidan_AND_once_upon_a_time(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = euromaidan_AND_once_upon_a_time_at_2013'), (euromaidan_AND_once_upon_a_time_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- euromaidan_AND_once_upon_a_time_aux().

