:- include('database.pl').
unification_of_italy(Start,End) :- begin('unification_of_italy',_,_,Start), end('unification_of_italy',_,_,End), Start=<End.

globally_unification_of_italy_during_6_28(Start,End) :- unification_of_italy(Start1,End1), Start is (Start1-6), End is (End1-28), Start=<End.

compare_globally_unification_of_italy_during_6_28(Dir,globally_unification_of_italy_during_6_28(Start1,_),globally_unification_of_italy_during_6_28(Start2,_)) :- Start1=<Start2.

generate_neg_globally_unification_of_italy_during_6_28([]).

generate_neg_globally_unification_of_italy_during_6_28([(Start,End) | Tail]) :- assert(neg_globally_unification_of_italy_during_6_28(Start,End)), generate_neg_globally_unification_of_italy_during_6_28(Tail).

sort_globally_unification_of_italy_during_6_28(SortedIntervals) :- findall((Start,End),globally_unification_of_italy_during_6_28(Start,End),UnsortedIntervals), predsort(compare_globally_unification_of_italy_during_6_28,UnsortedIntervals,SortedIntervals).

generate_neg_globally_unification_of_italy_during_6_28_aux() :- sort_globally_unification_of_italy_during_6_28(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_unification_of_italy_during_6_28(NegatedIntervals).

neg_globally_unification_of_italy_during_6_28_at_193(Res) :- setof((Start,End),neg_globally_unification_of_italy_during_6_28(Start,End),AllINtervals), checkvalidity(193,AllINtervals,Res).

check_query() :- write('Query = neg_globally_unification_of_italy_during_6_28_at_193'), (neg_globally_unification_of_italy_during_6_28_at_193(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_unification_of_italy_during_6_28_aux().

