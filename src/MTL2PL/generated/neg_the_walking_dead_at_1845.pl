:- include('database.pl').
the_walking_dead(Start,End) :- begin('the_walking_dead',_,_,Start), end('the_walking_dead',_,_,End), Start=<End.

compare_the_walking_dead(Dir,the_walking_dead(Start1,_),the_walking_dead(Start2,_)) :- Start1=<Start2.

generate_neg_the_walking_dead([]).

generate_neg_the_walking_dead([(Start,End) | Tail]) :- assert(neg_the_walking_dead(Start,End)), generate_neg_the_walking_dead(Tail).

sort_the_walking_dead(SortedIntervals) :- findall((Start,End),the_walking_dead(Start,End),UnsortedIntervals), predsort(compare_the_walking_dead,UnsortedIntervals,SortedIntervals).

generate_neg_the_walking_dead_aux() :- sort_the_walking_dead(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_the_walking_dead(NegatedIntervals).

neg_the_walking_dead_at_1845(Res) :- setof((Start,End),neg_the_walking_dead(Start,End),AllINtervals), checkvalidity(1845,AllINtervals,Res).

check_query() :- write('Query = neg_the_walking_dead_at_1845'), (neg_the_walking_dead_at_1845(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_the_walking_dead_aux().

