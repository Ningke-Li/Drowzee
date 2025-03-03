:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

globally_vostok_programme_during_16_45(Start,End) :- vostok_programme(Start1,End1), Start is (Start1-16), End is (End1-45), Start=<End.

compare_globally_vostok_programme_during_16_45(Dir,globally_vostok_programme_during_16_45(Start1,_),globally_vostok_programme_during_16_45(Start2,_)) :- Start1=<Start2.

generate_neg_globally_vostok_programme_during_16_45([]).

generate_neg_globally_vostok_programme_during_16_45([(Start,End) | Tail]) :- assert(neg_globally_vostok_programme_during_16_45(Start,End)), generate_neg_globally_vostok_programme_during_16_45(Tail).

sort_globally_vostok_programme_during_16_45(SortedIntervals) :- findall((Start,End),globally_vostok_programme_during_16_45(Start,End),UnsortedIntervals), predsort(compare_globally_vostok_programme_during_16_45,UnsortedIntervals,SortedIntervals).

generate_neg_globally_vostok_programme_during_16_45_aux() :- sort_globally_vostok_programme_during_16_45(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_vostok_programme_during_16_45(NegatedIntervals).

neg_globally_vostok_programme_during_16_45_at_912(Res) :- setof((Start,End),neg_globally_vostok_programme_during_16_45(Start,End),AllINtervals), checkvalidity(912,AllINtervals,Res).

check_query() :- write('Query = neg_globally_vostok_programme_during_16_45_at_912'), (neg_globally_vostok_programme_during_16_45_at_912(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_vostok_programme_during_16_45_aux().

