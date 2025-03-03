:- include('database.pl').
de_stijl(Start,End) :- begin('de_stijl',_,_,Start), end('de_stijl',_,_,End), Start=<End.

globally_de_stijl_during_4_5(Start,End) :- de_stijl(Start1,End1), Start is (Start1-4), End is (End1-5), Start=<End.

compare_globally_de_stijl_during_4_5(Dir,globally_de_stijl_during_4_5(Start1,_),globally_de_stijl_during_4_5(Start2,_)) :- Start1=<Start2.

generate_neg_globally_de_stijl_during_4_5([]).

generate_neg_globally_de_stijl_during_4_5([(Start,End) | Tail]) :- assert(neg_globally_de_stijl_during_4_5(Start,End)), generate_neg_globally_de_stijl_during_4_5(Tail).

sort_globally_de_stijl_during_4_5(SortedIntervals) :- findall((Start,End),globally_de_stijl_during_4_5(Start,End),UnsortedIntervals), predsort(compare_globally_de_stijl_during_4_5,UnsortedIntervals,SortedIntervals).

generate_neg_globally_de_stijl_during_4_5_aux() :- sort_globally_de_stijl_during_4_5(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_de_stijl_during_4_5(NegatedIntervals).

neg_globally_de_stijl_during_4_5_at_1091(Res) :- setof((Start,End),neg_globally_de_stijl_during_4_5(Start,End),AllINtervals), checkvalidity(1091,AllINtervals,Res).

check_query() :- write('Query = neg_globally_de_stijl_during_4_5_at_1091'), (neg_globally_de_stijl_during_4_5_at_1091(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_de_stijl_during_4_5_aux().

