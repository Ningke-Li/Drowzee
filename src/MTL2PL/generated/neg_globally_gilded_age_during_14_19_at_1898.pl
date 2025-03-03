:- include('database.pl').
gilded_age(Start,End) :- begin('gilded_age',_,_,Start), end('gilded_age',_,_,End), Start=<End.

globally_gilded_age_during_14_19(Start,End) :- gilded_age(Start1,End1), Start is (Start1-14), End is (End1-19), Start=<End.

compare_globally_gilded_age_during_14_19(Dir,globally_gilded_age_during_14_19(Start1,_),globally_gilded_age_during_14_19(Start2,_)) :- Start1=<Start2.

generate_neg_globally_gilded_age_during_14_19([]).

generate_neg_globally_gilded_age_during_14_19([(Start,End) | Tail]) :- assert(neg_globally_gilded_age_during_14_19(Start,End)), generate_neg_globally_gilded_age_during_14_19(Tail).

sort_globally_gilded_age_during_14_19(SortedIntervals) :- findall((Start,End),globally_gilded_age_during_14_19(Start,End),UnsortedIntervals), predsort(compare_globally_gilded_age_during_14_19,UnsortedIntervals,SortedIntervals).

generate_neg_globally_gilded_age_during_14_19_aux() :- sort_globally_gilded_age_during_14_19(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_gilded_age_during_14_19(NegatedIntervals).

neg_globally_gilded_age_during_14_19_at_1898(Res) :- setof((Start,End),neg_globally_gilded_age_during_14_19(Start,End),AllINtervals), checkvalidity(1898,AllINtervals,Res).

check_query() :- write('Query = neg_globally_gilded_age_during_14_19_at_1898'), (neg_globally_gilded_age_during_14_19_at_1898(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_gilded_age_during_14_19_aux().

