:- include('database.pl').
numbers(Start,End) :- begin('numbers',_,_,Start), end('numbers',_,_,End), Start=<End.

merlin(Start,End) :- begin('merlin',_,_,Start), end('merlin',_,_,End), Start=<End.

generate_facts_numbers_AND_merlin([]) :- assert(numbers_AND_merlin(-1,-1)).

generate_facts_numbers_AND_merlin([(Start,End) | Tail]) :- assert(numbers_AND_merlin(Start,End)), generate_facts_numbers_AND_merlin(Tail).

numbers_AND_merlin_aux() :- findall((Start,End),numbers(Start,End),Interval1), findall((Start,End),merlin(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_numbers_AND_merlin(Interval).

numbers_AND_merlin_at_1990(Res) :- setof((Start,End),numbers_AND_merlin(Start,End),AllINtervals), checkvalidity(1990,AllINtervals,Res).

check_query() :- write('Query = numbers_AND_merlin_at_1990'), (numbers_AND_merlin_at_1990(true) -> write('\nRes   = true');write('\nRes   = false')).
?- numbers_AND_merlin_aux().

