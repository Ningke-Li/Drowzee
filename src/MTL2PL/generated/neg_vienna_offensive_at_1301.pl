:- include('database.pl').
vienna_offensive(Start,End) :- begin('vienna_offensive',_,_,Start), end('vienna_offensive',_,_,End), Start=<End.

compare_vienna_offensive(Dir,vienna_offensive(Start1,_),vienna_offensive(Start2,_)) :- Start1=<Start2.

generate_neg_vienna_offensive([]).

generate_neg_vienna_offensive([(Start,End) | Tail]) :- assert(neg_vienna_offensive(Start,End)), generate_neg_vienna_offensive(Tail).

sort_vienna_offensive(SortedIntervals) :- findall((Start,End),vienna_offensive(Start,End),UnsortedIntervals), predsort(compare_vienna_offensive,UnsortedIntervals,SortedIntervals).

generate_neg_vienna_offensive_aux() :- sort_vienna_offensive(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_vienna_offensive(NegatedIntervals).

neg_vienna_offensive_at_1301(Res) :- setof((Start,End),neg_vienna_offensive(Start,End),AllINtervals), checkvalidity(1301,AllINtervals,Res).

check_query() :- write('Query = neg_vienna_offensive_at_1301'), (neg_vienna_offensive_at_1301(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_vienna_offensive_aux().

