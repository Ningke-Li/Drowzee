:- include('database.pl').
hurricane_ike(Start,End) :- begin('hurricane_ike',_,_,Start), end('hurricane_ike',_,_,End), Start=<End.

compare_hurricane_ike(Dir,hurricane_ike(Start1,_),hurricane_ike(Start2,_)) :- Start1=<Start2.

generate_neg_hurricane_ike([]).

generate_neg_hurricane_ike([(Start,End) | Tail]) :- assert(neg_hurricane_ike(Start,End)), generate_neg_hurricane_ike(Tail).

sort_hurricane_ike(SortedIntervals) :- findall((Start,End),hurricane_ike(Start,End),UnsortedIntervals), predsort(compare_hurricane_ike,UnsortedIntervals,SortedIntervals).

generate_neg_hurricane_ike_aux() :- sort_hurricane_ike(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_hurricane_ike(NegatedIntervals).

neg_hurricane_ike_at_1936(Res) :- setof((Start,End),neg_hurricane_ike(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = neg_hurricane_ike_at_1936'), (neg_hurricane_ike_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_hurricane_ike_aux().

