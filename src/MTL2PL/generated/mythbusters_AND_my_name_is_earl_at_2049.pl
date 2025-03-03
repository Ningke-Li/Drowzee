:- include('database.pl').
mythbusters(Start,End) :- begin('mythbusters',_,_,Start), end('mythbusters',_,_,End), Start=<End.

my_name_is_earl(Start,End) :- begin('my_name_is_earl',_,_,Start), end('my_name_is_earl',_,_,End), Start=<End.

generate_facts_mythbusters_AND_my_name_is_earl([]) :- assert(mythbusters_AND_my_name_is_earl(-1,-1)).

generate_facts_mythbusters_AND_my_name_is_earl([(Start,End) | Tail]) :- assert(mythbusters_AND_my_name_is_earl(Start,End)), generate_facts_mythbusters_AND_my_name_is_earl(Tail).

mythbusters_AND_my_name_is_earl_aux() :- findall((Start,End),mythbusters(Start,End),Interval1), findall((Start,End),my_name_is_earl(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mythbusters_AND_my_name_is_earl(Interval).

mythbusters_AND_my_name_is_earl_at_2049(Res) :- setof((Start,End),mythbusters_AND_my_name_is_earl(Start,End),AllINtervals), checkvalidity(2049,AllINtervals,Res).

check_query() :- write('Query = mythbusters_AND_my_name_is_earl_at_2049'), (mythbusters_AND_my_name_is_earl_at_2049(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mythbusters_AND_my_name_is_earl_aux().

