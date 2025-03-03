:- include('database.pl').
csi__ny(Start,End) :- begin('csi__ny',_,_,Start), end('csi__ny',_,_,End), Start=<End.

compare_csi__ny(Dir,csi__ny(Start1,_),csi__ny(Start2,_)) :- Start1=<Start2.

generate_neg_csi__ny([]).

generate_neg_csi__ny([(Start,End) | Tail]) :- assert(neg_csi__ny(Start,End)), generate_neg_csi__ny(Tail).

sort_csi__ny(SortedIntervals) :- findall((Start,End),csi__ny(Start,End),UnsortedIntervals), predsort(compare_csi__ny,UnsortedIntervals,SortedIntervals).

generate_neg_csi__ny_aux() :- sort_csi__ny(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_csi__ny(NegatedIntervals).

neg_csi__ny_at_1016(Res) :- setof((Start,End),neg_csi__ny(Start,End),AllINtervals), checkvalidity(1016,AllINtervals,Res).

check_query() :- write('Query = neg_csi__ny_at_1016'), (neg_csi__ny_at_1016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_csi__ny_aux().

