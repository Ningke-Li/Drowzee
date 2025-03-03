:- include('database.pl').
bojack_horseman(Start,End) :- begin('bojack_horseman',_,_,Start), end('bojack_horseman',_,_,End), Start=<End.

compare_bojack_horseman(Dir,bojack_horseman(Start1,_),bojack_horseman(Start2,_)) :- Start1=<Start2.

generate_neg_bojack_horseman([]).

generate_neg_bojack_horseman([(Start,End) | Tail]) :- assert(neg_bojack_horseman(Start,End)), generate_neg_bojack_horseman(Tail).

sort_bojack_horseman(SortedIntervals) :- findall((Start,End),bojack_horseman(Start,End),UnsortedIntervals), predsort(compare_bojack_horseman,UnsortedIntervals,SortedIntervals).

generate_neg_bojack_horseman_aux() :- sort_bojack_horseman(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_bojack_horseman(NegatedIntervals).

neg_bojack_horseman_at_1808(Res) :- setof((Start,End),neg_bojack_horseman(Start,End),AllINtervals), checkvalidity(1808,AllINtervals,Res).

check_query() :- write('Query = neg_bojack_horseman_at_1808'), (neg_bojack_horseman_at_1808(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_bojack_horseman_aux().

