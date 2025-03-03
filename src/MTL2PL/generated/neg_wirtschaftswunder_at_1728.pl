:- include('database.pl').
wirtschaftswunder(Start,End) :- begin('wirtschaftswunder',_,_,Start), end('wirtschaftswunder',_,_,End), Start=<End.

compare_wirtschaftswunder(Dir,wirtschaftswunder(Start1,_),wirtschaftswunder(Start2,_)) :- Start1=<Start2.

generate_neg_wirtschaftswunder([]).

generate_neg_wirtschaftswunder([(Start,End) | Tail]) :- assert(neg_wirtschaftswunder(Start,End)), generate_neg_wirtschaftswunder(Tail).

sort_wirtschaftswunder(SortedIntervals) :- findall((Start,End),wirtschaftswunder(Start,End),UnsortedIntervals), predsort(compare_wirtschaftswunder,UnsortedIntervals,SortedIntervals).

generate_neg_wirtschaftswunder_aux() :- sort_wirtschaftswunder(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_wirtschaftswunder(NegatedIntervals).

neg_wirtschaftswunder_at_1728(Res) :- setof((Start,End),neg_wirtschaftswunder(Start,End),AllINtervals), checkvalidity(1728,AllINtervals,Res).

check_query() :- write('Query = neg_wirtschaftswunder_at_1728'), (neg_wirtschaftswunder_at_1728(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_wirtschaftswunder_aux().

