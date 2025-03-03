:- include('database.pl').
tulip_period(Start,End) :- begin('tulip_period',_,_,Start), end('tulip_period',_,_,End), Start=<End.

globally_tulip_period_during_2_11(Start,End) :- tulip_period(Start1,End1), Start is (Start1-2), End is (End1-11), Start=<End.

compare_globally_tulip_period_during_2_11(Dir,globally_tulip_period_during_2_11(Start1,_),globally_tulip_period_during_2_11(Start2,_)) :- Start1=<Start2.

generate_neg_globally_tulip_period_during_2_11([]).

generate_neg_globally_tulip_period_during_2_11([(Start,End) | Tail]) :- assert(neg_globally_tulip_period_during_2_11(Start,End)), generate_neg_globally_tulip_period_during_2_11(Tail).

sort_globally_tulip_period_during_2_11(SortedIntervals) :- findall((Start,End),globally_tulip_period_during_2_11(Start,End),UnsortedIntervals), predsort(compare_globally_tulip_period_during_2_11,UnsortedIntervals,SortedIntervals).

generate_neg_globally_tulip_period_during_2_11_aux() :- sort_globally_tulip_period_during_2_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_tulip_period_during_2_11(NegatedIntervals).

neg_globally_tulip_period_during_2_11_at_816(Res) :- setof((Start,End),neg_globally_tulip_period_during_2_11(Start,End),AllINtervals), checkvalidity(816,AllINtervals,Res).

check_query() :- write('Query = neg_globally_tulip_period_during_2_11_at_816'), (neg_globally_tulip_period_during_2_11_at_816(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_tulip_period_during_2_11_aux().

