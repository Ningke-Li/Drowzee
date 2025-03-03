:- include('database.pl').
convertible_peso(Start,End) :- begin('convertible_peso',_,_,Start), end('convertible_peso',_,_,End), Start=<End.

globally_convertible_peso_during_5_15(Start,End) :- convertible_peso(Start1,End1), Start is (Start1-5), End is (End1-15), Start=<End.

compare_globally_convertible_peso_during_5_15(Dir,globally_convertible_peso_during_5_15(Start1,_),globally_convertible_peso_during_5_15(Start2,_)) :- Start1=<Start2.

generate_neg_globally_convertible_peso_during_5_15([]).

generate_neg_globally_convertible_peso_during_5_15([(Start,End) | Tail]) :- assert(neg_globally_convertible_peso_during_5_15(Start,End)), generate_neg_globally_convertible_peso_during_5_15(Tail).

sort_globally_convertible_peso_during_5_15(SortedIntervals) :- findall((Start,End),globally_convertible_peso_during_5_15(Start,End),UnsortedIntervals), predsort(compare_globally_convertible_peso_during_5_15,UnsortedIntervals,SortedIntervals).

generate_neg_globally_convertible_peso_during_5_15_aux() :- sort_globally_convertible_peso_during_5_15(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_convertible_peso_during_5_15(NegatedIntervals).

neg_globally_convertible_peso_during_5_15_at_1630(Res) :- setof((Start,End),neg_globally_convertible_peso_during_5_15(Start,End),AllINtervals), checkvalidity(1630,AllINtervals,Res).

check_query() :- write('Query = neg_globally_convertible_peso_during_5_15_at_1630'), (neg_globally_convertible_peso_during_5_15_at_1630(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_convertible_peso_during_5_15_aux().

