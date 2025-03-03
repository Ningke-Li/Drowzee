:- include('database.pl').
meuse_argonne_offensive(Start,End) :- begin('meuse_argonne_offensive',_,_,Start), end('meuse_argonne_offensive',_,_,End), Start=<End.

compare_meuse_argonne_offensive(Dir,meuse_argonne_offensive(Start1,_),meuse_argonne_offensive(Start2,_)) :- Start1=<Start2.

generate_neg_meuse_argonne_offensive([]).

generate_neg_meuse_argonne_offensive([(Start,End) | Tail]) :- assert(neg_meuse_argonne_offensive(Start,End)), generate_neg_meuse_argonne_offensive(Tail).

sort_meuse_argonne_offensive(SortedIntervals) :- findall((Start,End),meuse_argonne_offensive(Start,End),UnsortedIntervals), predsort(compare_meuse_argonne_offensive,UnsortedIntervals,SortedIntervals).

generate_neg_meuse_argonne_offensive_aux() :- sort_meuse_argonne_offensive(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_meuse_argonne_offensive(NegatedIntervals).

neg_meuse_argonne_offensive_at_1515(Res) :- setof((Start,End),neg_meuse_argonne_offensive(Start,End),AllINtervals), checkvalidity(1515,AllINtervals,Res).

check_query() :- write('Query = neg_meuse_argonne_offensive_at_1515'), (neg_meuse_argonne_offensive_at_1515(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_meuse_argonne_offensive_aux().

