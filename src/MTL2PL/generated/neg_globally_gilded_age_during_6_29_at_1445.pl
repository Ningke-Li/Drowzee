:- include('database.pl').
gilded_age(Start,End) :- begin('gilded_age',_,_,Start), end('gilded_age',_,_,End), Start=<End.

globally_gilded_age_during_6_29(Start,End) :- gilded_age(Start1,End1), Start is (Start1-6), End is (End1-29), Start=<End.

compare_globally_gilded_age_during_6_29(Dir,globally_gilded_age_during_6_29(Start1,_),globally_gilded_age_during_6_29(Start2,_)) :- Start1=<Start2.

generate_neg_globally_gilded_age_during_6_29([]).

generate_neg_globally_gilded_age_during_6_29([(Start,End) | Tail]) :- assert(neg_globally_gilded_age_during_6_29(Start,End)), generate_neg_globally_gilded_age_during_6_29(Tail).

sort_globally_gilded_age_during_6_29(SortedIntervals) :- findall((Start,End),globally_gilded_age_during_6_29(Start,End),UnsortedIntervals), predsort(compare_globally_gilded_age_during_6_29,UnsortedIntervals,SortedIntervals).

generate_neg_globally_gilded_age_during_6_29_aux() :- sort_globally_gilded_age_during_6_29(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_gilded_age_during_6_29(NegatedIntervals).

neg_globally_gilded_age_during_6_29_at_1445(Res) :- setof((Start,End),neg_globally_gilded_age_during_6_29(Start,End),AllINtervals), checkvalidity(1445,AllINtervals,Res).

check_query() :- write('Query = neg_globally_gilded_age_during_6_29_at_1445'), (neg_globally_gilded_age_during_6_29_at_1445(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_gilded_age_during_6_29_aux().

