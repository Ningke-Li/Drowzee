:- include('database.pl').
council_of_trent(Start,End) :- begin('council_of_trent',_,_,Start), end('council_of_trent',_,_,End), Start=<End.

finally_council_of_trent_during_4_17(Start,End) :- council_of_trent(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

compare_finally_council_of_trent_during_4_17(Dir,finally_council_of_trent_during_4_17(Start1,_),finally_council_of_trent_during_4_17(Start2,_)) :- Start1=<Start2.

generate_neg_finally_council_of_trent_during_4_17([]).

generate_neg_finally_council_of_trent_during_4_17([(Start,End) | Tail]) :- assert(neg_finally_council_of_trent_during_4_17(Start,End)), generate_neg_finally_council_of_trent_during_4_17(Tail).

sort_finally_council_of_trent_during_4_17(SortedIntervals) :- findall((Start,End),finally_council_of_trent_during_4_17(Start,End),UnsortedIntervals), predsort(compare_finally_council_of_trent_during_4_17,UnsortedIntervals,SortedIntervals).

generate_neg_finally_council_of_trent_during_4_17_aux() :- sort_finally_council_of_trent_during_4_17(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_council_of_trent_during_4_17(NegatedIntervals).

neg_finally_council_of_trent_during_4_17_at_1001(Res) :- setof((Start,End),neg_finally_council_of_trent_during_4_17(Start,End),AllINtervals), checkvalidity(1001,AllINtervals,Res).

check_query() :- write('Query = neg_finally_council_of_trent_during_4_17_at_1001'), (neg_finally_council_of_trent_during_4_17_at_1001(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_council_of_trent_during_4_17_aux().

