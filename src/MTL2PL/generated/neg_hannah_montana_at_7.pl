:- include('database.pl').
hannah_montana(Start,End) :- begin('hannah_montana',_,_,Start), end('hannah_montana',_,_,End), Start=<End.

compare_hannah_montana(Dir,hannah_montana(Start1,_),hannah_montana(Start2,_)) :- Start1=<Start2.

generate_neg_hannah_montana([]).

generate_neg_hannah_montana([(Start,End) | Tail]) :- assert(neg_hannah_montana(Start,End)), generate_neg_hannah_montana(Tail).

sort_hannah_montana(SortedIntervals) :- findall((Start,End),hannah_montana(Start,End),UnsortedIntervals), predsort(compare_hannah_montana,UnsortedIntervals,SortedIntervals).

generate_neg_hannah_montana_aux() :- sort_hannah_montana(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_hannah_montana(NegatedIntervals).

neg_hannah_montana_at_7(Res) :- setof((Start,End),neg_hannah_montana(Start,End),AllINtervals), checkvalidity(7,AllINtervals,Res).

check_query() :- write('Query = neg_hannah_montana_at_7'), (neg_hannah_montana_at_7(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_hannah_montana_aux().

