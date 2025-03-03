:- include('database.pl').
the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

globally_the_vampire_diaries_during_4_5(Start,End) :- the_vampire_diaries(Start1,End1), Start is (Start1-4), End is (End1-5), Start=<End.

compare_globally_the_vampire_diaries_during_4_5(Dir,globally_the_vampire_diaries_during_4_5(Start1,_),globally_the_vampire_diaries_during_4_5(Start2,_)) :- Start1=<Start2.

generate_neg_globally_the_vampire_diaries_during_4_5([]).

generate_neg_globally_the_vampire_diaries_during_4_5([(Start,End) | Tail]) :- assert(neg_globally_the_vampire_diaries_during_4_5(Start,End)), generate_neg_globally_the_vampire_diaries_during_4_5(Tail).

sort_globally_the_vampire_diaries_during_4_5(SortedIntervals) :- findall((Start,End),globally_the_vampire_diaries_during_4_5(Start,End),UnsortedIntervals), predsort(compare_globally_the_vampire_diaries_during_4_5,UnsortedIntervals,SortedIntervals).

generate_neg_globally_the_vampire_diaries_during_4_5_aux() :- sort_globally_the_vampire_diaries_during_4_5(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_the_vampire_diaries_during_4_5(NegatedIntervals).

neg_globally_the_vampire_diaries_during_4_5_at_258(Res) :- setof((Start,End),neg_globally_the_vampire_diaries_during_4_5(Start,End),AllINtervals), checkvalidity(258,AllINtervals,Res).

check_query() :- write('Query = neg_globally_the_vampire_diaries_during_4_5_at_258'), (neg_globally_the_vampire_diaries_during_4_5_at_258(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_the_vampire_diaries_during_4_5_aux().

