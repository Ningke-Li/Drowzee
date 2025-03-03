:- include('database.pl').
circassian_genocide(Start,End) :- begin('circassian_genocide',_,_,Start), end('circassian_genocide',_,_,End), Start=<End.

globally_circassian_genocide_during_10_37(Start,End) :- circassian_genocide(Start1,End1), Start is (Start1-10), End is (End1-37), Start=<End.

compare_globally_circassian_genocide_during_10_37(Dir,globally_circassian_genocide_during_10_37(Start1,_),globally_circassian_genocide_during_10_37(Start2,_)) :- Start1=<Start2.

generate_neg_globally_circassian_genocide_during_10_37([]).

generate_neg_globally_circassian_genocide_during_10_37([(Start,End) | Tail]) :- assert(neg_globally_circassian_genocide_during_10_37(Start,End)), generate_neg_globally_circassian_genocide_during_10_37(Tail).

sort_globally_circassian_genocide_during_10_37(SortedIntervals) :- findall((Start,End),globally_circassian_genocide_during_10_37(Start,End),UnsortedIntervals), predsort(compare_globally_circassian_genocide_during_10_37,UnsortedIntervals,SortedIntervals).

generate_neg_globally_circassian_genocide_during_10_37_aux() :- sort_globally_circassian_genocide_during_10_37(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_circassian_genocide_during_10_37(NegatedIntervals).

neg_globally_circassian_genocide_during_10_37_at_1274(Res) :- setof((Start,End),neg_globally_circassian_genocide_during_10_37(Start,End),AllINtervals), checkvalidity(1274,AllINtervals,Res).

check_query() :- write('Query = neg_globally_circassian_genocide_during_10_37_at_1274'), (neg_globally_circassian_genocide_during_10_37_at_1274(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_circassian_genocide_during_10_37_aux().

