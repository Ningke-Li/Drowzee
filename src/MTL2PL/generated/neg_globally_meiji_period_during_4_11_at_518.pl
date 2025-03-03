:- include('database.pl').
meiji_period(Start,End) :- begin('meiji_period',_,_,Start), end('meiji_period',_,_,End), Start=<End.

globally_meiji_period_during_4_11(Start,End) :- meiji_period(Start1,End1), Start is (Start1-4), End is (End1-11), Start=<End.

compare_globally_meiji_period_during_4_11(Dir,globally_meiji_period_during_4_11(Start1,_),globally_meiji_period_during_4_11(Start2,_)) :- Start1=<Start2.

generate_neg_globally_meiji_period_during_4_11([]).

generate_neg_globally_meiji_period_during_4_11([(Start,End) | Tail]) :- assert(neg_globally_meiji_period_during_4_11(Start,End)), generate_neg_globally_meiji_period_during_4_11(Tail).

sort_globally_meiji_period_during_4_11(SortedIntervals) :- findall((Start,End),globally_meiji_period_during_4_11(Start,End),UnsortedIntervals), predsort(compare_globally_meiji_period_during_4_11,UnsortedIntervals,SortedIntervals).

generate_neg_globally_meiji_period_during_4_11_aux() :- sort_globally_meiji_period_during_4_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_meiji_period_during_4_11(NegatedIntervals).

neg_globally_meiji_period_during_4_11_at_518(Res) :- setof((Start,End),neg_globally_meiji_period_during_4_11(Start,End),AllINtervals), checkvalidity(518,AllINtervals,Res).

check_query() :- write('Query = neg_globally_meiji_period_during_4_11_at_518'), (neg_globally_meiji_period_during_4_11_at_518(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_meiji_period_during_4_11_aux().

