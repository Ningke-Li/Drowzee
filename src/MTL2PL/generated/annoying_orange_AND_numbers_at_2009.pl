:- include('database.pl').
annoying_orange(Start,End) :- begin('annoying_orange',_,_,Start), end('annoying_orange',_,_,End), Start=<End.

numbers(Start,End) :- begin('numbers',_,_,Start), end('numbers',_,_,End), Start=<End.

generate_facts_annoying_orange_AND_numbers([]) :- assert(annoying_orange_AND_numbers(-1,-1)).

generate_facts_annoying_orange_AND_numbers([(Start,End) | Tail]) :- assert(annoying_orange_AND_numbers(Start,End)), generate_facts_annoying_orange_AND_numbers(Tail).

annoying_orange_AND_numbers_aux() :- findall((Start,End),annoying_orange(Start,End),Interval1), findall((Start,End),numbers(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_annoying_orange_AND_numbers(Interval).

annoying_orange_AND_numbers_at_2009(Res) :- setof((Start,End),annoying_orange_AND_numbers(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = annoying_orange_AND_numbers_at_2009'), (annoying_orange_AND_numbers_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- annoying_orange_AND_numbers_aux().

