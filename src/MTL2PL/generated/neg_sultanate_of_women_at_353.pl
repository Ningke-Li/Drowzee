:- include('database.pl').
sultanate_of_women(Start,End) :- begin('sultanate_of_women',_,_,Start), end('sultanate_of_women',_,_,End), Start=<End.

compare_sultanate_of_women(Dir,sultanate_of_women(Start1,_),sultanate_of_women(Start2,_)) :- Start1=<Start2.

generate_neg_sultanate_of_women([]).

generate_neg_sultanate_of_women([(Start,End) | Tail]) :- assert(neg_sultanate_of_women(Start,End)), generate_neg_sultanate_of_women(Tail).

sort_sultanate_of_women(SortedIntervals) :- findall((Start,End),sultanate_of_women(Start,End),UnsortedIntervals), predsort(compare_sultanate_of_women,UnsortedIntervals,SortedIntervals).

generate_neg_sultanate_of_women_aux() :- sort_sultanate_of_women(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_sultanate_of_women(NegatedIntervals).

neg_sultanate_of_women_at_353(Res) :- setof((Start,End),neg_sultanate_of_women(Start,End),AllINtervals), checkvalidity(353,AllINtervals,Res).

check_query() :- write('Query = neg_sultanate_of_women_at_353'), (neg_sultanate_of_women_at_353(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_sultanate_of_women_aux().

