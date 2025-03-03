:- include('database.pl').
man_vs__wild(Start,End) :- begin('man_vs__wild',_,_,Start), end('man_vs__wild',_,_,End), Start=<End.

compare_man_vs__wild(Dir,man_vs__wild(Start1,_),man_vs__wild(Start2,_)) :- Start1=<Start2.

generate_neg_man_vs__wild([]).

generate_neg_man_vs__wild([(Start,End) | Tail]) :- assert(neg_man_vs__wild(Start,End)), generate_neg_man_vs__wild(Tail).

sort_man_vs__wild(SortedIntervals) :- findall((Start,End),man_vs__wild(Start,End),UnsortedIntervals), predsort(compare_man_vs__wild,UnsortedIntervals,SortedIntervals).

generate_neg_man_vs__wild_aux() :- sort_man_vs__wild(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_man_vs__wild(NegatedIntervals).

neg_man_vs__wild_at_1677(Res) :- setof((Start,End),neg_man_vs__wild(Start,End),AllINtervals), checkvalidity(1677,AllINtervals,Res).

check_query() :- write('Query = neg_man_vs__wild_at_1677'), (neg_man_vs__wild_at_1677(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_man_vs__wild_aux().

