:- include('database.pl').
dream_high(Start,End) :- begin('dream_high',_,_,Start), end('dream_high',_,_,End), Start=<End.

compare_dream_high(Dir,dream_high(Start1,_),dream_high(Start2,_)) :- Start1=<Start2.

generate_neg_dream_high([]).

generate_neg_dream_high([(Start,End) | Tail]) :- assert(neg_dream_high(Start,End)), generate_neg_dream_high(Tail).

sort_dream_high(SortedIntervals) :- findall((Start,End),dream_high(Start,End),UnsortedIntervals), predsort(compare_dream_high,UnsortedIntervals,SortedIntervals).

generate_neg_dream_high_aux() :- sort_dream_high(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_dream_high(NegatedIntervals).

neg_dream_high_at_1426(Res) :- setof((Start,End),neg_dream_high(Start,End),AllINtervals), checkvalidity(1426,AllINtervals,Res).

check_query() :- write('Query = neg_dream_high_at_1426'), (neg_dream_high_at_1426(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_dream_high_aux().

