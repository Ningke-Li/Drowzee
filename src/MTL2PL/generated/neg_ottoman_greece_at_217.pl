:- include('database.pl').
ottoman_greece(Start,End) :- begin('ottoman_greece',_,_,Start), end('ottoman_greece',_,_,End), Start=<End.

compare_ottoman_greece(Dir,ottoman_greece(Start1,_),ottoman_greece(Start2,_)) :- Start1=<Start2.

generate_neg_ottoman_greece([]).

generate_neg_ottoman_greece([(Start,End) | Tail]) :- assert(neg_ottoman_greece(Start,End)), generate_neg_ottoman_greece(Tail).

sort_ottoman_greece(SortedIntervals) :- findall((Start,End),ottoman_greece(Start,End),UnsortedIntervals), predsort(compare_ottoman_greece,UnsortedIntervals,SortedIntervals).

generate_neg_ottoman_greece_aux() :- sort_ottoman_greece(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ottoman_greece(NegatedIntervals).

neg_ottoman_greece_at_217(Res) :- setof((Start,End),neg_ottoman_greece(Start,End),AllINtervals), checkvalidity(217,AllINtervals,Res).

check_query() :- write('Query = neg_ottoman_greece_at_217'), (neg_ottoman_greece_at_217(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ottoman_greece_aux().

