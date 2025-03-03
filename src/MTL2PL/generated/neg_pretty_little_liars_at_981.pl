:- include('database.pl').
pretty_little_liars(Start,End) :- begin('pretty_little_liars',_,_,Start), end('pretty_little_liars',_,_,End), Start=<End.

compare_pretty_little_liars(Dir,pretty_little_liars(Start1,_),pretty_little_liars(Start2,_)) :- Start1=<Start2.

generate_neg_pretty_little_liars([]).

generate_neg_pretty_little_liars([(Start,End) | Tail]) :- assert(neg_pretty_little_liars(Start,End)), generate_neg_pretty_little_liars(Tail).

sort_pretty_little_liars(SortedIntervals) :- findall((Start,End),pretty_little_liars(Start,End),UnsortedIntervals), predsort(compare_pretty_little_liars,UnsortedIntervals,SortedIntervals).

generate_neg_pretty_little_liars_aux() :- sort_pretty_little_liars(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_pretty_little_liars(NegatedIntervals).

neg_pretty_little_liars_at_981(Res) :- setof((Start,End),neg_pretty_little_liars(Start,End),AllINtervals), checkvalidity(981,AllINtervals,Res).

check_query() :- write('Query = neg_pretty_little_liars_at_981'), (neg_pretty_little_liars_at_981(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_pretty_little_liars_aux().

