:- include('database.pl').
we_bare_bears(Start,End) :- begin('we_bare_bears',_,_,Start), end('we_bare_bears',_,_,End), Start=<End.

globally_we_bare_bears_during_1_4(Start,End) :- we_bare_bears(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

compare_globally_we_bare_bears_during_1_4(Dir,globally_we_bare_bears_during_1_4(Start1,_),globally_we_bare_bears_during_1_4(Start2,_)) :- Start1=<Start2.

generate_neg_globally_we_bare_bears_during_1_4([]).

generate_neg_globally_we_bare_bears_during_1_4([(Start,End) | Tail]) :- assert(neg_globally_we_bare_bears_during_1_4(Start,End)), generate_neg_globally_we_bare_bears_during_1_4(Tail).

sort_globally_we_bare_bears_during_1_4(SortedIntervals) :- findall((Start,End),globally_we_bare_bears_during_1_4(Start,End),UnsortedIntervals), predsort(compare_globally_we_bare_bears_during_1_4,UnsortedIntervals,SortedIntervals).

generate_neg_globally_we_bare_bears_during_1_4_aux() :- sort_globally_we_bare_bears_during_1_4(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_we_bare_bears_during_1_4(NegatedIntervals).

neg_globally_we_bare_bears_during_1_4_at_308(Res) :- setof((Start,End),neg_globally_we_bare_bears_during_1_4(Start,End),AllINtervals), checkvalidity(308,AllINtervals,Res).

check_query() :- write('Query = neg_globally_we_bare_bears_during_1_4_at_308'), (neg_globally_we_bare_bears_during_1_4_at_308(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_we_bare_bears_during_1_4_aux().

