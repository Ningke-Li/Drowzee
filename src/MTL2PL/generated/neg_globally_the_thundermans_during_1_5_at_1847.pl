:- include('database.pl').
the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

globally_the_thundermans_during_1_5(Start,End) :- the_thundermans(Start1,End1), Start is (Start1-1), End is (End1-5), Start=<End.

compare_globally_the_thundermans_during_1_5(Dir,globally_the_thundermans_during_1_5(Start1,_),globally_the_thundermans_during_1_5(Start2,_)) :- Start1=<Start2.

generate_neg_globally_the_thundermans_during_1_5([]).

generate_neg_globally_the_thundermans_during_1_5([(Start,End) | Tail]) :- assert(neg_globally_the_thundermans_during_1_5(Start,End)), generate_neg_globally_the_thundermans_during_1_5(Tail).

sort_globally_the_thundermans_during_1_5(SortedIntervals) :- findall((Start,End),globally_the_thundermans_during_1_5(Start,End),UnsortedIntervals), predsort(compare_globally_the_thundermans_during_1_5,UnsortedIntervals,SortedIntervals).

generate_neg_globally_the_thundermans_during_1_5_aux() :- sort_globally_the_thundermans_during_1_5(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_the_thundermans_during_1_5(NegatedIntervals).

neg_globally_the_thundermans_during_1_5_at_1847(Res) :- setof((Start,End),neg_globally_the_thundermans_during_1_5(Start,End),AllINtervals), checkvalidity(1847,AllINtervals,Res).

check_query() :- write('Query = neg_globally_the_thundermans_during_1_5_at_1847'), (neg_globally_the_thundermans_during_1_5_at_1847(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_the_thundermans_during_1_5_aux().

