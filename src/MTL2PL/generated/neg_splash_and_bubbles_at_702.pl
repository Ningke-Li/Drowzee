:- include('database.pl').
splash_and_bubbles(Start,End) :- begin('splash_and_bubbles',_,_,Start), end('splash_and_bubbles',_,_,End), Start=<End.

compare_splash_and_bubbles(Dir,splash_and_bubbles(Start1,_),splash_and_bubbles(Start2,_)) :- Start1=<Start2.

generate_neg_splash_and_bubbles([]).

generate_neg_splash_and_bubbles([(Start,End) | Tail]) :- assert(neg_splash_and_bubbles(Start,End)), generate_neg_splash_and_bubbles(Tail).

sort_splash_and_bubbles(SortedIntervals) :- findall((Start,End),splash_and_bubbles(Start,End),UnsortedIntervals), predsort(compare_splash_and_bubbles,UnsortedIntervals,SortedIntervals).

generate_neg_splash_and_bubbles_aux() :- sort_splash_and_bubbles(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_splash_and_bubbles(NegatedIntervals).

neg_splash_and_bubbles_at_702(Res) :- setof((Start,End),neg_splash_and_bubbles(Start,End),AllINtervals), checkvalidity(702,AllINtervals,Res).

check_query() :- write('Query = neg_splash_and_bubbles_at_702'), (neg_splash_and_bubbles_at_702(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_splash_and_bubbles_aux().

