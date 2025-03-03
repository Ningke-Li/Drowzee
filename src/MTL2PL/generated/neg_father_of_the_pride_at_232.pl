:- include('database.pl').
father_of_the_pride(Start,End) :- begin('father_of_the_pride',_,_,Start), end('father_of_the_pride',_,_,End), Start=<End.

compare_father_of_the_pride(Dir,father_of_the_pride(Start1,_),father_of_the_pride(Start2,_)) :- Start1=<Start2.

generate_neg_father_of_the_pride([]).

generate_neg_father_of_the_pride([(Start,End) | Tail]) :- assert(neg_father_of_the_pride(Start,End)), generate_neg_father_of_the_pride(Tail).

sort_father_of_the_pride(SortedIntervals) :- findall((Start,End),father_of_the_pride(Start,End),UnsortedIntervals), predsort(compare_father_of_the_pride,UnsortedIntervals,SortedIntervals).

generate_neg_father_of_the_pride_aux() :- sort_father_of_the_pride(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_father_of_the_pride(NegatedIntervals).

neg_father_of_the_pride_at_232(Res) :- setof((Start,End),neg_father_of_the_pride(Start,End),AllINtervals), checkvalidity(232,AllINtervals,Res).

check_query() :- write('Query = neg_father_of_the_pride_at_232'), (neg_father_of_the_pride_at_232(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_father_of_the_pride_aux().

