:- include('database.pl').
fear_the_walking_dead(Start,End) :- begin('fear_the_walking_dead',_,_,Start), end('fear_the_walking_dead',_,_,End), Start=<End.

compare_fear_the_walking_dead(Dir,fear_the_walking_dead(Start1,_),fear_the_walking_dead(Start2,_)) :- Start1=<Start2.

generate_neg_fear_the_walking_dead([]).

generate_neg_fear_the_walking_dead([(Start,End) | Tail]) :- assert(neg_fear_the_walking_dead(Start,End)), generate_neg_fear_the_walking_dead(Tail).

sort_fear_the_walking_dead(SortedIntervals) :- findall((Start,End),fear_the_walking_dead(Start,End),UnsortedIntervals), predsort(compare_fear_the_walking_dead,UnsortedIntervals,SortedIntervals).

generate_neg_fear_the_walking_dead_aux() :- sort_fear_the_walking_dead(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_fear_the_walking_dead(NegatedIntervals).

neg_fear_the_walking_dead_at_1346(Res) :- setof((Start,End),neg_fear_the_walking_dead(Start,End),AllINtervals), checkvalidity(1346,AllINtervals,Res).

check_query() :- write('Query = neg_fear_the_walking_dead_at_1346'), (neg_fear_the_walking_dead_at_1346(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_fear_the_walking_dead_aux().

