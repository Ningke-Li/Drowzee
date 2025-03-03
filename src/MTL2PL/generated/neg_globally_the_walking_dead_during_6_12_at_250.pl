:- include('database.pl').
the_walking_dead(Start,End) :- begin('the_walking_dead',_,_,Start), end('the_walking_dead',_,_,End), Start=<End.

globally_the_walking_dead_during_6_12(Start,End) :- the_walking_dead(Start1,End1), Start is (Start1-6), End is (End1-12), Start=<End.

compare_globally_the_walking_dead_during_6_12(Dir,globally_the_walking_dead_during_6_12(Start1,_),globally_the_walking_dead_during_6_12(Start2,_)) :- Start1=<Start2.

generate_neg_globally_the_walking_dead_during_6_12([]).

generate_neg_globally_the_walking_dead_during_6_12([(Start,End) | Tail]) :- assert(neg_globally_the_walking_dead_during_6_12(Start,End)), generate_neg_globally_the_walking_dead_during_6_12(Tail).

sort_globally_the_walking_dead_during_6_12(SortedIntervals) :- findall((Start,End),globally_the_walking_dead_during_6_12(Start,End),UnsortedIntervals), predsort(compare_globally_the_walking_dead_during_6_12,UnsortedIntervals,SortedIntervals).

generate_neg_globally_the_walking_dead_during_6_12_aux() :- sort_globally_the_walking_dead_during_6_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_the_walking_dead_during_6_12(NegatedIntervals).

neg_globally_the_walking_dead_during_6_12_at_250(Res) :- setof((Start,End),neg_globally_the_walking_dead_during_6_12(Start,End),AllINtervals), checkvalidity(250,AllINtervals,Res).

check_query() :- write('Query = neg_globally_the_walking_dead_during_6_12_at_250'), (neg_globally_the_walking_dead_during_6_12_at_250(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_the_walking_dead_during_6_12_aux().

