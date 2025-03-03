:- include('database.pl').
dutch_golden_age_painting(Start,End) :- begin('dutch_golden_age_painting',_,_,Start), end('dutch_golden_age_painting',_,_,End), Start=<End.

compare_dutch_golden_age_painting(Dir,dutch_golden_age_painting(Start1,_),dutch_golden_age_painting(Start2,_)) :- Start1=<Start2.

generate_neg_dutch_golden_age_painting([]).

generate_neg_dutch_golden_age_painting([(Start,End) | Tail]) :- assert(neg_dutch_golden_age_painting(Start,End)), generate_neg_dutch_golden_age_painting(Tail).

sort_dutch_golden_age_painting(SortedIntervals) :- findall((Start,End),dutch_golden_age_painting(Start,End),UnsortedIntervals), predsort(compare_dutch_golden_age_painting,UnsortedIntervals,SortedIntervals).

generate_neg_dutch_golden_age_painting_aux() :- sort_dutch_golden_age_painting(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_dutch_golden_age_painting(NegatedIntervals).

neg_dutch_golden_age_painting_at_733(Res) :- setof((Start,End),neg_dutch_golden_age_painting(Start,End),AllINtervals), checkvalidity(733,AllINtervals,Res).

check_query() :- write('Query = neg_dutch_golden_age_painting_at_733'), (neg_dutch_golden_age_painting_at_733(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_dutch_golden_age_painting_aux().

