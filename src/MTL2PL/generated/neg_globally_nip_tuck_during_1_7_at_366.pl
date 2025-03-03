:- include('database.pl').
nip_tuck(Start,End) :- begin('nip_tuck',_,_,Start), end('nip_tuck',_,_,End), Start=<End.

globally_nip_tuck_during_1_7(Start,End) :- nip_tuck(Start1,End1), Start is (Start1-1), End is (End1-7), Start=<End.

compare_globally_nip_tuck_during_1_7(Dir,globally_nip_tuck_during_1_7(Start1,_),globally_nip_tuck_during_1_7(Start2,_)) :- Start1=<Start2.

generate_neg_globally_nip_tuck_during_1_7([]).

generate_neg_globally_nip_tuck_during_1_7([(Start,End) | Tail]) :- assert(neg_globally_nip_tuck_during_1_7(Start,End)), generate_neg_globally_nip_tuck_during_1_7(Tail).

sort_globally_nip_tuck_during_1_7(SortedIntervals) :- findall((Start,End),globally_nip_tuck_during_1_7(Start,End),UnsortedIntervals), predsort(compare_globally_nip_tuck_during_1_7,UnsortedIntervals,SortedIntervals).

generate_neg_globally_nip_tuck_during_1_7_aux() :- sort_globally_nip_tuck_during_1_7(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_nip_tuck_during_1_7(NegatedIntervals).

neg_globally_nip_tuck_during_1_7_at_366(Res) :- setof((Start,End),neg_globally_nip_tuck_during_1_7(Start,End),AllINtervals), checkvalidity(366,AllINtervals,Res).

check_query() :- write('Query = neg_globally_nip_tuck_during_1_7_at_366'), (neg_globally_nip_tuck_during_1_7_at_366(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_nip_tuck_during_1_7_aux().

