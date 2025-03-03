:- include('database.pl').
westerplatte(Start,End) :- begin('westerplatte',_,_,Start), end('westerplatte',_,_,End), Start=<End.

compare_westerplatte(Dir,westerplatte(Start1,_),westerplatte(Start2,_)) :- Start1=<Start2.

generate_neg_westerplatte([]).

generate_neg_westerplatte([(Start,End) | Tail]) :- assert(neg_westerplatte(Start,End)), generate_neg_westerplatte(Tail).

sort_westerplatte(SortedIntervals) :- findall((Start,End),westerplatte(Start,End),UnsortedIntervals), predsort(compare_westerplatte,UnsortedIntervals,SortedIntervals).

generate_neg_westerplatte_aux() :- sort_westerplatte(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_westerplatte(NegatedIntervals).

neg_westerplatte_at_1987(Res) :- setof((Start,End),neg_westerplatte(Start,End),AllINtervals), checkvalidity(1987,AllINtervals,Res).

check_query() :- write('Query = neg_westerplatte_at_1987'), (neg_westerplatte_at_1987(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_westerplatte_aux().

