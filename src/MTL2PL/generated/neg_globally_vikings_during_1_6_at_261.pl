:- include('database.pl').
vikings(Start,End) :- begin('vikings',_,_,Start), end('vikings',_,_,End), Start=<End.

globally_vikings_during_1_6(Start,End) :- vikings(Start1,End1), Start is (Start1-1), End is (End1-6), Start=<End.

compare_globally_vikings_during_1_6(Dir,globally_vikings_during_1_6(Start1,_),globally_vikings_during_1_6(Start2,_)) :- Start1=<Start2.

generate_neg_globally_vikings_during_1_6([]).

generate_neg_globally_vikings_during_1_6([(Start,End) | Tail]) :- assert(neg_globally_vikings_during_1_6(Start,End)), generate_neg_globally_vikings_during_1_6(Tail).

sort_globally_vikings_during_1_6(SortedIntervals) :- findall((Start,End),globally_vikings_during_1_6(Start,End),UnsortedIntervals), predsort(compare_globally_vikings_during_1_6,UnsortedIntervals,SortedIntervals).

generate_neg_globally_vikings_during_1_6_aux() :- sort_globally_vikings_during_1_6(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_vikings_during_1_6(NegatedIntervals).

neg_globally_vikings_during_1_6_at_261(Res) :- setof((Start,End),neg_globally_vikings_during_1_6(Start,End),AllINtervals), checkvalidity(261,AllINtervals,Res).

check_query() :- write('Query = neg_globally_vikings_during_1_6_at_261'), (neg_globally_vikings_during_1_6_at_261(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_vikings_during_1_6_aux().

