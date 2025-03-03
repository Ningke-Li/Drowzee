:- include('database.pl').
gurren_lagann(Start,End) :- begin('gurren_lagann',_,_,Start), end('gurren_lagann',_,_,End), Start=<End.

compare_gurren_lagann(Dir,gurren_lagann(Start1,_),gurren_lagann(Start2,_)) :- Start1=<Start2.

generate_neg_gurren_lagann([]).

generate_neg_gurren_lagann([(Start,End) | Tail]) :- assert(neg_gurren_lagann(Start,End)), generate_neg_gurren_lagann(Tail).

sort_gurren_lagann(SortedIntervals) :- findall((Start,End),gurren_lagann(Start,End),UnsortedIntervals), predsort(compare_gurren_lagann,UnsortedIntervals,SortedIntervals).

generate_neg_gurren_lagann_aux() :- sort_gurren_lagann(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_gurren_lagann(NegatedIntervals).

neg_gurren_lagann_at_115(Res) :- setof((Start,End),neg_gurren_lagann(Start,End),AllINtervals), checkvalidity(115,AllINtervals,Res).

check_query() :- write('Query = neg_gurren_lagann_at_115'), (neg_gurren_lagann_at_115(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_gurren_lagann_aux().

