:- include('database.pl').
mr__robot(Start,End) :- begin('mr__robot',_,_,Start), end('mr__robot',_,_,End), Start=<End.

compare_mr__robot(Dir,mr__robot(Start1,_),mr__robot(Start2,_)) :- Start1=<Start2.

generate_neg_mr__robot([]).

generate_neg_mr__robot([(Start,End) | Tail]) :- assert(neg_mr__robot(Start,End)), generate_neg_mr__robot(Tail).

sort_mr__robot(SortedIntervals) :- findall((Start,End),mr__robot(Start,End),UnsortedIntervals), predsort(compare_mr__robot,UnsortedIntervals,SortedIntervals).

generate_neg_mr__robot_aux() :- sort_mr__robot(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_mr__robot(NegatedIntervals).

neg_mr__robot_at_1353(Res) :- setof((Start,End),neg_mr__robot(Start,End),AllINtervals), checkvalidity(1353,AllINtervals,Res).

check_query() :- write('Query = neg_mr__robot_at_1353'), (neg_mr__robot_at_1353(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_mr__robot_aux().

