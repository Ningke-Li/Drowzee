:- include('database.pl').
renaissance(Start,End) :- begin('renaissance',_,_,Start), end('renaissance',_,_,End), Start=<End.

globally_renaissance_during_8_245(Start,End) :- renaissance(Start1,End1), Start is (Start1-8), End is (End1-245), Start=<End.

compare_globally_renaissance_during_8_245(Dir,globally_renaissance_during_8_245(Start1,_),globally_renaissance_during_8_245(Start2,_)) :- Start1=<Start2.

generate_neg_globally_renaissance_during_8_245([]).

generate_neg_globally_renaissance_during_8_245([(Start,End) | Tail]) :- assert(neg_globally_renaissance_during_8_245(Start,End)), generate_neg_globally_renaissance_during_8_245(Tail).

sort_globally_renaissance_during_8_245(SortedIntervals) :- findall((Start,End),globally_renaissance_during_8_245(Start,End),UnsortedIntervals), predsort(compare_globally_renaissance_during_8_245,UnsortedIntervals,SortedIntervals).

generate_neg_globally_renaissance_during_8_245_aux() :- sort_globally_renaissance_during_8_245(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_renaissance_during_8_245(NegatedIntervals).

neg_globally_renaissance_during_8_245_at_657(Res) :- setof((Start,End),neg_globally_renaissance_during_8_245(Start,End),AllINtervals), checkvalidity(657,AllINtervals,Res).

check_query() :- write('Query = neg_globally_renaissance_during_8_245_at_657'), (neg_globally_renaissance_during_8_245_at_657(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_renaissance_during_8_245_aux().

