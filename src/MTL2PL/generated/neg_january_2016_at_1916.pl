:- include('database.pl').
january_2016(Start,End) :- begin('january_2016',_,_,Start), end('january_2016',_,_,End), Start=<End.

compare_january_2016(Dir,january_2016(Start1,_),january_2016(Start2,_)) :- Start1=<Start2.

generate_neg_january_2016([]).

generate_neg_january_2016([(Start,End) | Tail]) :- assert(neg_january_2016(Start,End)), generate_neg_january_2016(Tail).

sort_january_2016(SortedIntervals) :- findall((Start,End),january_2016(Start,End),UnsortedIntervals), predsort(compare_january_2016,UnsortedIntervals,SortedIntervals).

generate_neg_january_2016_aux() :- sort_january_2016(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_january_2016(NegatedIntervals).

neg_january_2016_at_1916(Res) :- setof((Start,End),neg_january_2016(Start,End),AllINtervals), checkvalidity(1916,AllINtervals,Res).

check_query() :- write('Query = neg_january_2016_at_1916'), (neg_january_2016_at_1916(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_january_2016_aux().

