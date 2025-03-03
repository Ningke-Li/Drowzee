:- include('database.pl').
thirteen_years__war(Start,End) :- begin('thirteen_years__war',_,_,Start), end('thirteen_years__war',_,_,End), Start=<End.

finally_thirteen_years__war_during_5_18(Start,End) :- thirteen_years__war(Start1,End1), (Start1-18)=<(End1-5), Start is (Start1-18), End is (End1-5), Start=<End.

compare_finally_thirteen_years__war_during_5_18(Dir,finally_thirteen_years__war_during_5_18(Start1,_),finally_thirteen_years__war_during_5_18(Start2,_)) :- Start1=<Start2.

generate_neg_finally_thirteen_years__war_during_5_18([]).

generate_neg_finally_thirteen_years__war_during_5_18([(Start,End) | Tail]) :- assert(neg_finally_thirteen_years__war_during_5_18(Start,End)), generate_neg_finally_thirteen_years__war_during_5_18(Tail).

sort_finally_thirteen_years__war_during_5_18(SortedIntervals) :- findall((Start,End),finally_thirteen_years__war_during_5_18(Start,End),UnsortedIntervals), predsort(compare_finally_thirteen_years__war_during_5_18,UnsortedIntervals,SortedIntervals).

generate_neg_finally_thirteen_years__war_during_5_18_aux() :- sort_finally_thirteen_years__war_during_5_18(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_thirteen_years__war_during_5_18(NegatedIntervals).

neg_finally_thirteen_years__war_during_5_18_at_2047(Res) :- setof((Start,End),neg_finally_thirteen_years__war_during_5_18(Start,End),AllINtervals), checkvalidity(2047,AllINtervals,Res).

check_query() :- write('Query = neg_finally_thirteen_years__war_during_5_18_at_2047'), (neg_finally_thirteen_years__war_during_5_18_at_2047(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_thirteen_years__war_during_5_18_aux().

