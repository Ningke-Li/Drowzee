:- include('database.pl').
brothers___sisters(Start,End) :- begin('brothers___sisters',_,_,Start), end('brothers___sisters',_,_,End), Start=<End.

my_name_is_earl(Start,End) :- begin('my_name_is_earl',_,_,Start), end('my_name_is_earl',_,_,End), Start=<End.

generate_facts_brothers___sisters_AND_my_name_is_earl([]) :- assert(brothers___sisters_AND_my_name_is_earl(-1,-1)).

generate_facts_brothers___sisters_AND_my_name_is_earl([(Start,End) | Tail]) :- assert(brothers___sisters_AND_my_name_is_earl(Start,End)), generate_facts_brothers___sisters_AND_my_name_is_earl(Tail).

brothers___sisters_AND_my_name_is_earl_aux() :- findall((Start,End),brothers___sisters(Start,End),Interval1), findall((Start,End),my_name_is_earl(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_brothers___sisters_AND_my_name_is_earl(Interval).

brothers___sisters_AND_my_name_is_earl_at_1920(Res) :- setof((Start,End),brothers___sisters_AND_my_name_is_earl(Start,End),AllINtervals), checkvalidity(1920,AllINtervals,Res).

check_query() :- write('Query = brothers___sisters_AND_my_name_is_earl_at_1920'), (brothers___sisters_AND_my_name_is_earl_at_1920(true) -> write('\nRes   = true');write('\nRes   = false')).
?- brothers___sisters_AND_my_name_is_earl_aux().

