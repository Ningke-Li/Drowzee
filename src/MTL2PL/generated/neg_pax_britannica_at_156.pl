:- include('database.pl').
pax_britannica(Start,End) :- begin('pax_britannica',_,_,Start), end('pax_britannica',_,_,End), Start=<End.

compare_pax_britannica(Dir,pax_britannica(Start1,_),pax_britannica(Start2,_)) :- Start1=<Start2.

generate_neg_pax_britannica([]).

generate_neg_pax_britannica([(Start,End) | Tail]) :- assert(neg_pax_britannica(Start,End)), generate_neg_pax_britannica(Tail).

sort_pax_britannica(SortedIntervals) :- findall((Start,End),pax_britannica(Start,End),UnsortedIntervals), predsort(compare_pax_britannica,UnsortedIntervals,SortedIntervals).

generate_neg_pax_britannica_aux() :- sort_pax_britannica(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_pax_britannica(NegatedIntervals).

neg_pax_britannica_at_156(Res) :- setof((Start,End),neg_pax_britannica(Start,End),AllINtervals), checkvalidity(156,AllINtervals,Res).

check_query() :- write('Query = neg_pax_britannica_at_156'), (neg_pax_britannica_at_156(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_pax_britannica_aux().

