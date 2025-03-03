:- include('database.pl').
numbers(Start,End) :- begin('numbers',_,_,Start), end('numbers',_,_,End), Start=<End.

top_gear(Start,End) :- begin('top_gear',_,_,Start), end('top_gear',_,_,End), Start=<End.

generate_facts_numbers_AND_top_gear([]) :- assert(numbers_AND_top_gear(-1,-1)).

generate_facts_numbers_AND_top_gear([(Start,End) | Tail]) :- assert(numbers_AND_top_gear(Start,End)), generate_facts_numbers_AND_top_gear(Tail).

numbers_AND_top_gear_aux() :- findall((Start,End),numbers(Start,End),Interval1), findall((Start,End),top_gear(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_numbers_AND_top_gear(Interval).

numbers_AND_top_gear_at_2024(Res) :- setof((Start,End),numbers_AND_top_gear(Start,End),AllINtervals), checkvalidity(2024,AllINtervals,Res).

check_query() :- write('Query = numbers_AND_top_gear_at_2024'), (numbers_AND_top_gear_at_2024(true) -> write('\nRes   = true');write('\nRes   = false')).
?- numbers_AND_top_gear_aux().

