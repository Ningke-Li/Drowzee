:- include('database.pl').
lucifer(Start,End) :- begin('lucifer',_,_,Start), end('lucifer',_,_,End), Start=<End.

compare_lucifer(Dir,lucifer(Start1,_),lucifer(Start2,_)) :- Start1=<Start2.

generate_neg_lucifer([]).

generate_neg_lucifer([(Start,End) | Tail]) :- assert(neg_lucifer(Start,End)), generate_neg_lucifer(Tail).

sort_lucifer(SortedIntervals) :- findall((Start,End),lucifer(Start,End),UnsortedIntervals), predsort(compare_lucifer,UnsortedIntervals,SortedIntervals).

generate_neg_lucifer_aux() :- sort_lucifer(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_lucifer(NegatedIntervals).

neg_lucifer_at_1170(Res) :- setof((Start,End),neg_lucifer(Start,End),AllINtervals), checkvalidity(1170,AllINtervals,Res).

check_query() :- write('Query = neg_lucifer_at_1170'), (neg_lucifer_at_1170(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_lucifer_aux().

