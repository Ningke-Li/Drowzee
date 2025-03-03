:- include('database.pl').
chuck(Start,End) :- begin('chuck',_,_,Start), end('chuck',_,_,End), Start=<End.

globally_chuck_during_1_5(Start,End) :- chuck(Start1,End1), Start is (Start1-1), End is (End1-5), Start=<End.

compare_globally_chuck_during_1_5(Dir,globally_chuck_during_1_5(Start1,_),globally_chuck_during_1_5(Start2,_)) :- Start1=<Start2.

generate_neg_globally_chuck_during_1_5([]).

generate_neg_globally_chuck_during_1_5([(Start,End) | Tail]) :- assert(neg_globally_chuck_during_1_5(Start,End)), generate_neg_globally_chuck_during_1_5(Tail).

sort_globally_chuck_during_1_5(SortedIntervals) :- findall((Start,End),globally_chuck_during_1_5(Start,End),UnsortedIntervals), predsort(compare_globally_chuck_during_1_5,UnsortedIntervals,SortedIntervals).

generate_neg_globally_chuck_during_1_5_aux() :- sort_globally_chuck_during_1_5(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_chuck_during_1_5(NegatedIntervals).

neg_globally_chuck_during_1_5_at_1123(Res) :- setof((Start,End),neg_globally_chuck_during_1_5(Start,End),AllINtervals), checkvalidity(1123,AllINtervals,Res).

check_query() :- write('Query = neg_globally_chuck_during_1_5_at_1123'), (neg_globally_chuck_during_1_5_at_1123(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_chuck_during_1_5_aux().

