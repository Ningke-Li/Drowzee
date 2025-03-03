:- include('database.pl').
peaky_blinders(Start,End) :- begin('peaky_blinders',_,_,Start), end('peaky_blinders',_,_,End), Start=<End.

compare_peaky_blinders(Dir,peaky_blinders(Start1,_),peaky_blinders(Start2,_)) :- Start1=<Start2.

generate_neg_peaky_blinders([]).

generate_neg_peaky_blinders([(Start,End) | Tail]) :- assert(neg_peaky_blinders(Start,End)), generate_neg_peaky_blinders(Tail).

sort_peaky_blinders(SortedIntervals) :- findall((Start,End),peaky_blinders(Start,End),UnsortedIntervals), predsort(compare_peaky_blinders,UnsortedIntervals,SortedIntervals).

generate_neg_peaky_blinders_aux() :- sort_peaky_blinders(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_peaky_blinders(NegatedIntervals).

neg_peaky_blinders_at_486(Res) :- setof((Start,End),neg_peaky_blinders(Start,End),AllINtervals), checkvalidity(486,AllINtervals,Res).

check_query() :- write('Query = neg_peaky_blinders_at_486'), (neg_peaky_blinders_at_486(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_peaky_blinders_aux().

