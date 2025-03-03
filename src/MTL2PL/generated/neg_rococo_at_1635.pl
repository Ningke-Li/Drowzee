:- include('database.pl').
rococo(Start,End) :- begin('rococo',_,_,Start), end('rococo',_,_,End), Start=<End.

compare_rococo(Dir,rococo(Start1,_),rococo(Start2,_)) :- Start1=<Start2.

generate_neg_rococo([]).

generate_neg_rococo([(Start,End) | Tail]) :- assert(neg_rococo(Start,End)), generate_neg_rococo(Tail).

sort_rococo(SortedIntervals) :- findall((Start,End),rococo(Start,End),UnsortedIntervals), predsort(compare_rococo,UnsortedIntervals,SortedIntervals).

generate_neg_rococo_aux() :- sort_rococo(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_rococo(NegatedIntervals).

neg_rococo_at_1635(Res) :- setof((Start,End),neg_rococo(Start,End),AllINtervals), checkvalidity(1635,AllINtervals,Res).

check_query() :- write('Query = neg_rococo_at_1635'), (neg_rococo_at_1635(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_rococo_aux().

