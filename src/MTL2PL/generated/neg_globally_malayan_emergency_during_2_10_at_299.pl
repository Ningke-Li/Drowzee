:- include('database.pl').
malayan_emergency(Start,End) :- begin('malayan_emergency',_,_,Start), end('malayan_emergency',_,_,End), Start=<End.

globally_malayan_emergency_during_2_10(Start,End) :- malayan_emergency(Start1,End1), Start is (Start1-2), End is (End1-10), Start=<End.

compare_globally_malayan_emergency_during_2_10(Dir,globally_malayan_emergency_during_2_10(Start1,_),globally_malayan_emergency_during_2_10(Start2,_)) :- Start1=<Start2.

generate_neg_globally_malayan_emergency_during_2_10([]).

generate_neg_globally_malayan_emergency_during_2_10([(Start,End) | Tail]) :- assert(neg_globally_malayan_emergency_during_2_10(Start,End)), generate_neg_globally_malayan_emergency_during_2_10(Tail).

sort_globally_malayan_emergency_during_2_10(SortedIntervals) :- findall((Start,End),globally_malayan_emergency_during_2_10(Start,End),UnsortedIntervals), predsort(compare_globally_malayan_emergency_during_2_10,UnsortedIntervals,SortedIntervals).

generate_neg_globally_malayan_emergency_during_2_10_aux() :- sort_globally_malayan_emergency_during_2_10(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_malayan_emergency_during_2_10(NegatedIntervals).

neg_globally_malayan_emergency_during_2_10_at_299(Res) :- setof((Start,End),neg_globally_malayan_emergency_during_2_10(Start,End),AllINtervals), checkvalidity(299,AllINtervals,Res).

check_query() :- write('Query = neg_globally_malayan_emergency_during_2_10_at_299'), (neg_globally_malayan_emergency_during_2_10_at_299(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_malayan_emergency_during_2_10_aux().

