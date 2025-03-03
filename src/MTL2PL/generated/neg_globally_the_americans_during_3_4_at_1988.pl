:- include('database.pl').
the_americans(Start,End) :- begin('the_americans',_,_,Start), end('the_americans',_,_,End), Start=<End.

globally_the_americans_during_3_4(Start,End) :- the_americans(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

compare_globally_the_americans_during_3_4(Dir,globally_the_americans_during_3_4(Start1,_),globally_the_americans_during_3_4(Start2,_)) :- Start1=<Start2.

generate_neg_globally_the_americans_during_3_4([]).

generate_neg_globally_the_americans_during_3_4([(Start,End) | Tail]) :- assert(neg_globally_the_americans_during_3_4(Start,End)), generate_neg_globally_the_americans_during_3_4(Tail).

sort_globally_the_americans_during_3_4(SortedIntervals) :- findall((Start,End),globally_the_americans_during_3_4(Start,End),UnsortedIntervals), predsort(compare_globally_the_americans_during_3_4,UnsortedIntervals,SortedIntervals).

generate_neg_globally_the_americans_during_3_4_aux() :- sort_globally_the_americans_during_3_4(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_the_americans_during_3_4(NegatedIntervals).

neg_globally_the_americans_during_3_4_at_1988(Res) :- setof((Start,End),neg_globally_the_americans_during_3_4(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = neg_globally_the_americans_during_3_4_at_1988'), (neg_globally_the_americans_during_3_4_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_the_americans_during_3_4_aux().

