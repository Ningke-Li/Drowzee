:- include('database.pl').
texas_revoluci_n(Start,End) :- begin('texas_revoluci_n',_,_,Start), end('texas_revoluci_n',_,_,End), Start=<End.

compare_texas_revoluci_n(Dir,texas_revoluci_n(Start1,_),texas_revoluci_n(Start2,_)) :- Start1=<Start2.

generate_neg_texas_revoluci_n([]).

generate_neg_texas_revoluci_n([(Start,End) | Tail]) :- assert(neg_texas_revoluci_n(Start,End)), generate_neg_texas_revoluci_n(Tail).

sort_texas_revoluci_n(SortedIntervals) :- findall((Start,End),texas_revoluci_n(Start,End),UnsortedIntervals), predsort(compare_texas_revoluci_n,UnsortedIntervals,SortedIntervals).

generate_neg_texas_revoluci_n_aux() :- sort_texas_revoluci_n(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_texas_revoluci_n(NegatedIntervals).

neg_texas_revoluci_n_at_1340(Res) :- setof((Start,End),neg_texas_revoluci_n(Start,End),AllINtervals), checkvalidity(1340,AllINtervals,Res).

check_query() :- write('Query = neg_texas_revoluci_n_at_1340'), (neg_texas_revoluci_n_at_1340(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_texas_revoluci_n_aux().

