:- include('database.pl').
fifth_council_of_the_lateran(Start,End) :- begin('fifth_council_of_the_lateran',_,_,Start), end('fifth_council_of_the_lateran',_,_,End), Start=<End.

compare_fifth_council_of_the_lateran(Dir,fifth_council_of_the_lateran(Start1,_),fifth_council_of_the_lateran(Start2,_)) :- Start1=<Start2.

generate_neg_fifth_council_of_the_lateran([]).

generate_neg_fifth_council_of_the_lateran([(Start,End) | Tail]) :- assert(neg_fifth_council_of_the_lateran(Start,End)), generate_neg_fifth_council_of_the_lateran(Tail).

sort_fifth_council_of_the_lateran(SortedIntervals) :- findall((Start,End),fifth_council_of_the_lateran(Start,End),UnsortedIntervals), predsort(compare_fifth_council_of_the_lateran,UnsortedIntervals,SortedIntervals).

generate_neg_fifth_council_of_the_lateran_aux() :- sort_fifth_council_of_the_lateran(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_fifth_council_of_the_lateran(NegatedIntervals).

neg_fifth_council_of_the_lateran_at_431(Res) :- setof((Start,End),neg_fifth_council_of_the_lateran(Start,End),AllINtervals), checkvalidity(431,AllINtervals,Res).

check_query() :- write('Query = neg_fifth_council_of_the_lateran_at_431'), (neg_fifth_council_of_the_lateran_at_431(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_fifth_council_of_the_lateran_aux().

