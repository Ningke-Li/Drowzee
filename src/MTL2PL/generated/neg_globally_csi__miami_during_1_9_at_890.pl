:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

globally_csi__miami_during_1_9(Start,End) :- csi__miami(Start1,End1), Start is (Start1-1), End is (End1-9), Start=<End.

compare_globally_csi__miami_during_1_9(Dir,globally_csi__miami_during_1_9(Start1,_),globally_csi__miami_during_1_9(Start2,_)) :- Start1=<Start2.

generate_neg_globally_csi__miami_during_1_9([]).

generate_neg_globally_csi__miami_during_1_9([(Start,End) | Tail]) :- assert(neg_globally_csi__miami_during_1_9(Start,End)), generate_neg_globally_csi__miami_during_1_9(Tail).

sort_globally_csi__miami_during_1_9(SortedIntervals) :- findall((Start,End),globally_csi__miami_during_1_9(Start,End),UnsortedIntervals), predsort(compare_globally_csi__miami_during_1_9,UnsortedIntervals,SortedIntervals).

generate_neg_globally_csi__miami_during_1_9_aux() :- sort_globally_csi__miami_during_1_9(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_csi__miami_during_1_9(NegatedIntervals).

neg_globally_csi__miami_during_1_9_at_890(Res) :- setof((Start,End),neg_globally_csi__miami_during_1_9(Start,End),AllINtervals), checkvalidity(890,AllINtervals,Res).

check_query() :- write('Query = neg_globally_csi__miami_during_1_9_at_890'), (neg_globally_csi__miami_during_1_9_at_890(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_csi__miami_during_1_9_aux().

