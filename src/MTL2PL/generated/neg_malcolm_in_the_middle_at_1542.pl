:- include('database.pl').
malcolm_in_the_middle(Start,End) :- begin('malcolm_in_the_middle',_,_,Start), end('malcolm_in_the_middle',_,_,End), Start=<End.

compare_malcolm_in_the_middle(Dir,malcolm_in_the_middle(Start1,_),malcolm_in_the_middle(Start2,_)) :- Start1=<Start2.

generate_neg_malcolm_in_the_middle([]).

generate_neg_malcolm_in_the_middle([(Start,End) | Tail]) :- assert(neg_malcolm_in_the_middle(Start,End)), generate_neg_malcolm_in_the_middle(Tail).

sort_malcolm_in_the_middle(SortedIntervals) :- findall((Start,End),malcolm_in_the_middle(Start,End),UnsortedIntervals), predsort(compare_malcolm_in_the_middle,UnsortedIntervals,SortedIntervals).

generate_neg_malcolm_in_the_middle_aux() :- sort_malcolm_in_the_middle(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_malcolm_in_the_middle(NegatedIntervals).

neg_malcolm_in_the_middle_at_1542(Res) :- setof((Start,End),neg_malcolm_in_the_middle(Start,End),AllINtervals), checkvalidity(1542,AllINtervals,Res).

check_query() :- write('Query = neg_malcolm_in_the_middle_at_1542'), (neg_malcolm_in_the_middle_at_1542(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_malcolm_in_the_middle_aux().

