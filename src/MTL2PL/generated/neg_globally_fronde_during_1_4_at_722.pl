:- include('database.pl').
fronde(Start,End) :- begin('fronde',_,_,Start), end('fronde',_,_,End), Start=<End.

globally_fronde_during_1_4(Start,End) :- fronde(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

compare_globally_fronde_during_1_4(Dir,globally_fronde_during_1_4(Start1,_),globally_fronde_during_1_4(Start2,_)) :- Start1=<Start2.

generate_neg_globally_fronde_during_1_4([]).

generate_neg_globally_fronde_during_1_4([(Start,End) | Tail]) :- assert(neg_globally_fronde_during_1_4(Start,End)), generate_neg_globally_fronde_during_1_4(Tail).

sort_globally_fronde_during_1_4(SortedIntervals) :- findall((Start,End),globally_fronde_during_1_4(Start,End),UnsortedIntervals), predsort(compare_globally_fronde_during_1_4,UnsortedIntervals,SortedIntervals).

generate_neg_globally_fronde_during_1_4_aux() :- sort_globally_fronde_during_1_4(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_fronde_during_1_4(NegatedIntervals).

neg_globally_fronde_during_1_4_at_722(Res) :- setof((Start,End),neg_globally_fronde_during_1_4(Start,End),AllINtervals), checkvalidity(722,AllINtervals,Res).

check_query() :- write('Query = neg_globally_fronde_during_1_4_at_722'), (neg_globally_fronde_during_1_4_at_722(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_fronde_during_1_4_aux().

