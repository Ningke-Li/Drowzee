:- include('database.pl').
foster_s_home_for_imaginary_friends(Start,End) :- begin('foster_s_home_for_imaginary_friends',_,_,Start), end('foster_s_home_for_imaginary_friends',_,_,End), Start=<End.

finally_foster_s_home_for_imaginary_friends_during_2_16(Start,End) :- foster_s_home_for_imaginary_friends(Start1,End1), (Start1-16)=<(End1-2), Start is (Start1-16), End is (End1-2), Start=<End.

compare_finally_foster_s_home_for_imaginary_friends_during_2_16(Dir,finally_foster_s_home_for_imaginary_friends_during_2_16(Start1,_),finally_foster_s_home_for_imaginary_friends_during_2_16(Start2,_)) :- Start1=<Start2.

generate_neg_finally_foster_s_home_for_imaginary_friends_during_2_16([]).

generate_neg_finally_foster_s_home_for_imaginary_friends_during_2_16([(Start,End) | Tail]) :- assert(neg_finally_foster_s_home_for_imaginary_friends_during_2_16(Start,End)), generate_neg_finally_foster_s_home_for_imaginary_friends_during_2_16(Tail).

sort_finally_foster_s_home_for_imaginary_friends_during_2_16(SortedIntervals) :- findall((Start,End),finally_foster_s_home_for_imaginary_friends_during_2_16(Start,End),UnsortedIntervals), predsort(compare_finally_foster_s_home_for_imaginary_friends_during_2_16,UnsortedIntervals,SortedIntervals).

generate_neg_finally_foster_s_home_for_imaginary_friends_during_2_16_aux() :- sort_finally_foster_s_home_for_imaginary_friends_during_2_16(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_foster_s_home_for_imaginary_friends_during_2_16(NegatedIntervals).

neg_finally_foster_s_home_for_imaginary_friends_during_2_16_at_1035(Res) :- setof((Start,End),neg_finally_foster_s_home_for_imaginary_friends_during_2_16(Start,End),AllINtervals), checkvalidity(1035,AllINtervals,Res).

check_query() :- write('Query = neg_finally_foster_s_home_for_imaginary_friends_during_2_16_at_1035'), (neg_finally_foster_s_home_for_imaginary_friends_during_2_16_at_1035(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_foster_s_home_for_imaginary_friends_during_2_16_aux().

