:- include('database.pl').
juncker_commission(Start,End) :- begin('juncker_commission',_,_,Start), end('juncker_commission',_,_,End), Start=<End.

compare_juncker_commission(Dir,juncker_commission(Start1,_),juncker_commission(Start2,_)) :- Start1=<Start2.

generate_neg_juncker_commission([]).

generate_neg_juncker_commission([(Start,End) | Tail]) :- assert(neg_juncker_commission(Start,End)), generate_neg_juncker_commission(Tail).

sort_juncker_commission(SortedIntervals) :- findall((Start,End),juncker_commission(Start,End),UnsortedIntervals), predsort(compare_juncker_commission,UnsortedIntervals,SortedIntervals).

generate_neg_juncker_commission_aux() :- sort_juncker_commission(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_juncker_commission(NegatedIntervals).

neg_juncker_commission_at_298(Res) :- setof((Start,End),neg_juncker_commission(Start,End),AllINtervals), checkvalidity(298,AllINtervals,Res).

check_query() :- write('Query = neg_juncker_commission_at_298'), (neg_juncker_commission_at_298(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_juncker_commission_aux().

