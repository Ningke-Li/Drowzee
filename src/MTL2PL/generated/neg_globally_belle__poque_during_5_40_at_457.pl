:- include('database.pl').
belle__poque(Start,End) :- begin('belle__poque',_,_,Start), end('belle__poque',_,_,End), Start=<End.

globally_belle__poque_during_5_40(Start,End) :- belle__poque(Start1,End1), Start is (Start1-5), End is (End1-40), Start=<End.

compare_globally_belle__poque_during_5_40(Dir,globally_belle__poque_during_5_40(Start1,_),globally_belle__poque_during_5_40(Start2,_)) :- Start1=<Start2.

generate_neg_globally_belle__poque_during_5_40([]).

generate_neg_globally_belle__poque_during_5_40([(Start,End) | Tail]) :- assert(neg_globally_belle__poque_during_5_40(Start,End)), generate_neg_globally_belle__poque_during_5_40(Tail).

sort_globally_belle__poque_during_5_40(SortedIntervals) :- findall((Start,End),globally_belle__poque_during_5_40(Start,End),UnsortedIntervals), predsort(compare_globally_belle__poque_during_5_40,UnsortedIntervals,SortedIntervals).

generate_neg_globally_belle__poque_during_5_40_aux() :- sort_globally_belle__poque_during_5_40(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_belle__poque_during_5_40(NegatedIntervals).

neg_globally_belle__poque_during_5_40_at_457(Res) :- setof((Start,End),neg_globally_belle__poque_during_5_40(Start,End),AllINtervals), checkvalidity(457,AllINtervals,Res).

check_query() :- write('Query = neg_globally_belle__poque_during_5_40_at_457'), (neg_globally_belle__poque_during_5_40_at_457(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_belle__poque_during_5_40_aux().

