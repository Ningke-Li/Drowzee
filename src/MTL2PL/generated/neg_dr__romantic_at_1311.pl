:- include('database.pl').
dr__romantic(Start,End) :- begin('dr__romantic',_,_,Start), end('dr__romantic',_,_,End), Start=<End.

compare_dr__romantic(Dir,dr__romantic(Start1,_),dr__romantic(Start2,_)) :- Start1=<Start2.

generate_neg_dr__romantic([]).

generate_neg_dr__romantic([(Start,End) | Tail]) :- assert(neg_dr__romantic(Start,End)), generate_neg_dr__romantic(Tail).

sort_dr__romantic(SortedIntervals) :- findall((Start,End),dr__romantic(Start,End),UnsortedIntervals), predsort(compare_dr__romantic,UnsortedIntervals,SortedIntervals).

generate_neg_dr__romantic_aux() :- sort_dr__romantic(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_dr__romantic(NegatedIntervals).

neg_dr__romantic_at_1311(Res) :- setof((Start,End),neg_dr__romantic(Start,End),AllINtervals), checkvalidity(1311,AllINtervals,Res).

check_query() :- write('Query = neg_dr__romantic_at_1311'), (neg_dr__romantic_at_1311(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_dr__romantic_aux().

