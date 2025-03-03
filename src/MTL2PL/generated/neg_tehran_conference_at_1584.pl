:- include('database.pl').
tehran_conference(Start,End) :- begin('tehran_conference',_,_,Start), end('tehran_conference',_,_,End), Start=<End.

compare_tehran_conference(Dir,tehran_conference(Start1,_),tehran_conference(Start2,_)) :- Start1=<Start2.

generate_neg_tehran_conference([]).

generate_neg_tehran_conference([(Start,End) | Tail]) :- assert(neg_tehran_conference(Start,End)), generate_neg_tehran_conference(Tail).

sort_tehran_conference(SortedIntervals) :- findall((Start,End),tehran_conference(Start,End),UnsortedIntervals), predsort(compare_tehran_conference,UnsortedIntervals,SortedIntervals).

generate_neg_tehran_conference_aux() :- sort_tehran_conference(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_tehran_conference(NegatedIntervals).

neg_tehran_conference_at_1584(Res) :- setof((Start,End),neg_tehran_conference(Start,End),AllINtervals), checkvalidity(1584,AllINtervals,Res).

check_query() :- write('Query = neg_tehran_conference_at_1584'), (neg_tehran_conference_at_1584(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_tehran_conference_aux().

