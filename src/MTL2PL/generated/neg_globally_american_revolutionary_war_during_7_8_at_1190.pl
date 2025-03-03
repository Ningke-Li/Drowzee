:- include('database.pl').
american_revolutionary_war(Start,End) :- begin('american_revolutionary_war',_,_,Start), end('american_revolutionary_war',_,_,End), Start=<End.

globally_american_revolutionary_war_during_7_8(Start,End) :- american_revolutionary_war(Start1,End1), Start is (Start1-7), End is (End1-8), Start=<End.

compare_globally_american_revolutionary_war_during_7_8(Dir,globally_american_revolutionary_war_during_7_8(Start1,_),globally_american_revolutionary_war_during_7_8(Start2,_)) :- Start1=<Start2.

generate_neg_globally_american_revolutionary_war_during_7_8([]).

generate_neg_globally_american_revolutionary_war_during_7_8([(Start,End) | Tail]) :- assert(neg_globally_american_revolutionary_war_during_7_8(Start,End)), generate_neg_globally_american_revolutionary_war_during_7_8(Tail).

sort_globally_american_revolutionary_war_during_7_8(SortedIntervals) :- findall((Start,End),globally_american_revolutionary_war_during_7_8(Start,End),UnsortedIntervals), predsort(compare_globally_american_revolutionary_war_during_7_8,UnsortedIntervals,SortedIntervals).

generate_neg_globally_american_revolutionary_war_during_7_8_aux() :- sort_globally_american_revolutionary_war_during_7_8(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_american_revolutionary_war_during_7_8(NegatedIntervals).

neg_globally_american_revolutionary_war_during_7_8_at_1190(Res) :- setof((Start,End),neg_globally_american_revolutionary_war_during_7_8(Start,End),AllINtervals), checkvalidity(1190,AllINtervals,Res).

check_query() :- write('Query = neg_globally_american_revolutionary_war_during_7_8_at_1190'), (neg_globally_american_revolutionary_war_during_7_8_at_1190(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_american_revolutionary_war_during_7_8_aux().

