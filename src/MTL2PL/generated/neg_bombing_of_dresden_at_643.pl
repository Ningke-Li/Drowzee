:- include('database.pl').
bombing_of_dresden(Start,End) :- begin('bombing_of_dresden',_,_,Start), end('bombing_of_dresden',_,_,End), Start=<End.

compare_bombing_of_dresden(Dir,bombing_of_dresden(Start1,_),bombing_of_dresden(Start2,_)) :- Start1=<Start2.

generate_neg_bombing_of_dresden([]).

generate_neg_bombing_of_dresden([(Start,End) | Tail]) :- assert(neg_bombing_of_dresden(Start,End)), generate_neg_bombing_of_dresden(Tail).

sort_bombing_of_dresden(SortedIntervals) :- findall((Start,End),bombing_of_dresden(Start,End),UnsortedIntervals), predsort(compare_bombing_of_dresden,UnsortedIntervals,SortedIntervals).

generate_neg_bombing_of_dresden_aux() :- sort_bombing_of_dresden(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_bombing_of_dresden(NegatedIntervals).

neg_bombing_of_dresden_at_643(Res) :- setof((Start,End),neg_bombing_of_dresden(Start,End),AllINtervals), checkvalidity(643,AllINtervals,Res).

check_query() :- write('Query = neg_bombing_of_dresden_at_643'), (neg_bombing_of_dresden_at_643(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_bombing_of_dresden_aux().

