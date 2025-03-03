:- include('database.pl').
council_of_florence(Start,End) :- begin('council_of_florence',_,_,Start), end('council_of_florence',_,_,End), Start=<End.

globally_council_of_florence_during_6_11(Start,End) :- council_of_florence(Start1,End1), Start is (Start1-6), End is (End1-11), Start=<End.

compare_globally_council_of_florence_during_6_11(Dir,globally_council_of_florence_during_6_11(Start1,_),globally_council_of_florence_during_6_11(Start2,_)) :- Start1=<Start2.

generate_neg_globally_council_of_florence_during_6_11([]).

generate_neg_globally_council_of_florence_during_6_11([(Start,End) | Tail]) :- assert(neg_globally_council_of_florence_during_6_11(Start,End)), generate_neg_globally_council_of_florence_during_6_11(Tail).

sort_globally_council_of_florence_during_6_11(SortedIntervals) :- findall((Start,End),globally_council_of_florence_during_6_11(Start,End),UnsortedIntervals), predsort(compare_globally_council_of_florence_during_6_11,UnsortedIntervals,SortedIntervals).

generate_neg_globally_council_of_florence_during_6_11_aux() :- sort_globally_council_of_florence_during_6_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_council_of_florence_during_6_11(NegatedIntervals).

neg_globally_council_of_florence_during_6_11_at_797(Res) :- setof((Start,End),neg_globally_council_of_florence_during_6_11(Start,End),AllINtervals), checkvalidity(797,AllINtervals,Res).

check_query() :- write('Query = neg_globally_council_of_florence_during_6_11_at_797'), (neg_globally_council_of_florence_during_6_11_at_797(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_council_of_florence_during_6_11_aux().

