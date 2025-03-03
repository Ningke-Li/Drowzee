:- include('database.pl').
beer_hall_putsch(Start,End) :- begin('beer_hall_putsch',_,_,Start), end('beer_hall_putsch',_,_,End), Start=<End.

compare_beer_hall_putsch(Dir,beer_hall_putsch(Start1,_),beer_hall_putsch(Start2,_)) :- Start1=<Start2.

generate_neg_beer_hall_putsch([]).

generate_neg_beer_hall_putsch([(Start,End) | Tail]) :- assert(neg_beer_hall_putsch(Start,End)), generate_neg_beer_hall_putsch(Tail).

sort_beer_hall_putsch(SortedIntervals) :- findall((Start,End),beer_hall_putsch(Start,End),UnsortedIntervals), predsort(compare_beer_hall_putsch,UnsortedIntervals,SortedIntervals).

generate_neg_beer_hall_putsch_aux() :- sort_beer_hall_putsch(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_beer_hall_putsch(NegatedIntervals).

neg_beer_hall_putsch_at_1758(Res) :- setof((Start,End),neg_beer_hall_putsch(Start,End),AllINtervals), checkvalidity(1758,AllINtervals,Res).

check_query() :- write('Query = neg_beer_hall_putsch_at_1758'), (neg_beer_hall_putsch_at_1758(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_beer_hall_putsch_aux().

