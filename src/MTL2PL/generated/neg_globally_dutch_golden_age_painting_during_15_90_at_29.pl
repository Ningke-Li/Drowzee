:- include('database.pl').
dutch_golden_age_painting(Start,End) :- begin('dutch_golden_age_painting',_,_,Start), end('dutch_golden_age_painting',_,_,End), Start=<End.

globally_dutch_golden_age_painting_during_15_90(Start,End) :- dutch_golden_age_painting(Start1,End1), Start is (Start1-15), End is (End1-90), Start=<End.

compare_globally_dutch_golden_age_painting_during_15_90(Dir,globally_dutch_golden_age_painting_during_15_90(Start1,_),globally_dutch_golden_age_painting_during_15_90(Start2,_)) :- Start1=<Start2.

generate_neg_globally_dutch_golden_age_painting_during_15_90([]).

generate_neg_globally_dutch_golden_age_painting_during_15_90([(Start,End) | Tail]) :- assert(neg_globally_dutch_golden_age_painting_during_15_90(Start,End)), generate_neg_globally_dutch_golden_age_painting_during_15_90(Tail).

sort_globally_dutch_golden_age_painting_during_15_90(SortedIntervals) :- findall((Start,End),globally_dutch_golden_age_painting_during_15_90(Start,End),UnsortedIntervals), predsort(compare_globally_dutch_golden_age_painting_during_15_90,UnsortedIntervals,SortedIntervals).

generate_neg_globally_dutch_golden_age_painting_during_15_90_aux() :- sort_globally_dutch_golden_age_painting_during_15_90(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_dutch_golden_age_painting_during_15_90(NegatedIntervals).

neg_globally_dutch_golden_age_painting_during_15_90_at_29(Res) :- setof((Start,End),neg_globally_dutch_golden_age_painting_during_15_90(Start,End),AllINtervals), checkvalidity(29,AllINtervals,Res).

check_query() :- write('Query = neg_globally_dutch_golden_age_painting_during_15_90_at_29'), (neg_globally_dutch_golden_age_painting_during_15_90_at_29(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_dutch_golden_age_painting_during_15_90_aux().

