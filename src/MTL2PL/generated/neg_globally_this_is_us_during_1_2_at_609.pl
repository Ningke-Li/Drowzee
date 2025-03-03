:- include('database.pl').
this_is_us(Start,End) :- begin('this_is_us',_,_,Start), end('this_is_us',_,_,End), Start=<End.

globally_this_is_us_during_1_2(Start,End) :- this_is_us(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

compare_globally_this_is_us_during_1_2(Dir,globally_this_is_us_during_1_2(Start1,_),globally_this_is_us_during_1_2(Start2,_)) :- Start1=<Start2.

generate_neg_globally_this_is_us_during_1_2([]).

generate_neg_globally_this_is_us_during_1_2([(Start,End) | Tail]) :- assert(neg_globally_this_is_us_during_1_2(Start,End)), generate_neg_globally_this_is_us_during_1_2(Tail).

sort_globally_this_is_us_during_1_2(SortedIntervals) :- findall((Start,End),globally_this_is_us_during_1_2(Start,End),UnsortedIntervals), predsort(compare_globally_this_is_us_during_1_2,UnsortedIntervals,SortedIntervals).

generate_neg_globally_this_is_us_during_1_2_aux() :- sort_globally_this_is_us_during_1_2(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_this_is_us_during_1_2(NegatedIntervals).

neg_globally_this_is_us_during_1_2_at_609(Res) :- setof((Start,End),neg_globally_this_is_us_during_1_2(Start,End),AllINtervals), checkvalidity(609,AllINtervals,Res).

check_query() :- write('Query = neg_globally_this_is_us_during_1_2_at_609'), (neg_globally_this_is_us_during_1_2_at_609(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_this_is_us_during_1_2_aux().

