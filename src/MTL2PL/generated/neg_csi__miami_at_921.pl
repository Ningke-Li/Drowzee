:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

compare_csi__miami(Dir,csi__miami(Start1,_),csi__miami(Start2,_)) :- Start1=<Start2.

generate_neg_csi__miami([]).

generate_neg_csi__miami([(Start,End) | Tail]) :- assert(neg_csi__miami(Start,End)), generate_neg_csi__miami(Tail).

sort_csi__miami(SortedIntervals) :- findall((Start,End),csi__miami(Start,End),UnsortedIntervals), predsort(compare_csi__miami,UnsortedIntervals,SortedIntervals).

generate_neg_csi__miami_aux() :- sort_csi__miami(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_csi__miami(NegatedIntervals).

neg_csi__miami_at_921(Res) :- setof((Start,End),neg_csi__miami(Start,End),AllINtervals), checkvalidity(921,AllINtervals,Res).

check_query() :- write('Query = neg_csi__miami_at_921'), (neg_csi__miami_at_921(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_csi__miami_aux().

