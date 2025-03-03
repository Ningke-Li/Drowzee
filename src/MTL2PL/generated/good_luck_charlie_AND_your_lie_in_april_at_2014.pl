:- include('database.pl').
good_luck_charlie(Start,End) :- begin('good_luck_charlie',_,_,Start), end('good_luck_charlie',_,_,End), Start=<End.

your_lie_in_april(Start,End) :- begin('your_lie_in_april',_,_,Start), end('your_lie_in_april',_,_,End), Start=<End.

generate_facts_good_luck_charlie_AND_your_lie_in_april([]) :- assert(good_luck_charlie_AND_your_lie_in_april(-1,-1)).

generate_facts_good_luck_charlie_AND_your_lie_in_april([(Start,End) | Tail]) :- assert(good_luck_charlie_AND_your_lie_in_april(Start,End)), generate_facts_good_luck_charlie_AND_your_lie_in_april(Tail).

good_luck_charlie_AND_your_lie_in_april_aux() :- findall((Start,End),good_luck_charlie(Start,End),Interval1), findall((Start,End),your_lie_in_april(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_good_luck_charlie_AND_your_lie_in_april(Interval).

good_luck_charlie_AND_your_lie_in_april_at_2014(Res) :- setof((Start,End),good_luck_charlie_AND_your_lie_in_april(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = good_luck_charlie_AND_your_lie_in_april_at_2014'), (good_luck_charlie_AND_your_lie_in_april_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- good_luck_charlie_AND_your_lie_in_april_aux().

