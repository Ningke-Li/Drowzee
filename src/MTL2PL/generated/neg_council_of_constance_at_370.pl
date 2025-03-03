:- include('database.pl').
council_of_constance(Start,End) :- begin('council_of_constance',_,_,Start), end('council_of_constance',_,_,End), Start=<End.

compare_council_of_constance(Dir,council_of_constance(Start1,_),council_of_constance(Start2,_)) :- Start1=<Start2.

generate_neg_council_of_constance([]).

generate_neg_council_of_constance([(Start,End) | Tail]) :- assert(neg_council_of_constance(Start,End)), generate_neg_council_of_constance(Tail).

sort_council_of_constance(SortedIntervals) :- findall((Start,End),council_of_constance(Start,End),UnsortedIntervals), predsort(compare_council_of_constance,UnsortedIntervals,SortedIntervals).

generate_neg_council_of_constance_aux() :- sort_council_of_constance(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_council_of_constance(NegatedIntervals).

neg_council_of_constance_at_370(Res) :- setof((Start,End),neg_council_of_constance(Start,End),AllINtervals), checkvalidity(370,AllINtervals,Res).

check_query() :- write('Query = neg_council_of_constance_at_370'), (neg_council_of_constance_at_370(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_council_of_constance_aux().

