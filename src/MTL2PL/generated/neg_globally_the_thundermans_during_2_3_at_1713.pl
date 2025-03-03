:- include('database.pl').
the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

globally_the_thundermans_during_2_3(Start,End) :- the_thundermans(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

compare_globally_the_thundermans_during_2_3(Dir,globally_the_thundermans_during_2_3(Start1,_),globally_the_thundermans_during_2_3(Start2,_)) :- Start1=<Start2.

generate_neg_globally_the_thundermans_during_2_3([]).

generate_neg_globally_the_thundermans_during_2_3([(Start,End) | Tail]) :- assert(neg_globally_the_thundermans_during_2_3(Start,End)), generate_neg_globally_the_thundermans_during_2_3(Tail).

sort_globally_the_thundermans_during_2_3(SortedIntervals) :- findall((Start,End),globally_the_thundermans_during_2_3(Start,End),UnsortedIntervals), predsort(compare_globally_the_thundermans_during_2_3,UnsortedIntervals,SortedIntervals).

generate_neg_globally_the_thundermans_during_2_3_aux() :- sort_globally_the_thundermans_during_2_3(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_the_thundermans_during_2_3(NegatedIntervals).

neg_globally_the_thundermans_during_2_3_at_1713(Res) :- setof((Start,End),neg_globally_the_thundermans_during_2_3(Start,End),AllINtervals), checkvalidity(1713,AllINtervals,Res).

check_query() :- write('Query = neg_globally_the_thundermans_during_2_3_at_1713'), (neg_globally_the_thundermans_during_2_3_at_1713(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_the_thundermans_during_2_3_aux().

