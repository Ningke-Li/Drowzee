:- include('database.pl').
third_russo_turkish_war(Start,End) :- begin('third_russo_turkish_war',_,_,Start), end('third_russo_turkish_war',_,_,End), Start=<End.

finally_third_russo_turkish_war_during_4_17(Start,End) :- third_russo_turkish_war(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

compare_finally_third_russo_turkish_war_during_4_17(Dir,finally_third_russo_turkish_war_during_4_17(Start1,_),finally_third_russo_turkish_war_during_4_17(Start2,_)) :- Start1=<Start2.

generate_neg_finally_third_russo_turkish_war_during_4_17([]).

generate_neg_finally_third_russo_turkish_war_during_4_17([(Start,End) | Tail]) :- assert(neg_finally_third_russo_turkish_war_during_4_17(Start,End)), generate_neg_finally_third_russo_turkish_war_during_4_17(Tail).

sort_finally_third_russo_turkish_war_during_4_17(SortedIntervals) :- findall((Start,End),finally_third_russo_turkish_war_during_4_17(Start,End),UnsortedIntervals), predsort(compare_finally_third_russo_turkish_war_during_4_17,UnsortedIntervals,SortedIntervals).

generate_neg_finally_third_russo_turkish_war_during_4_17_aux() :- sort_finally_third_russo_turkish_war_during_4_17(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_third_russo_turkish_war_during_4_17(NegatedIntervals).

neg_finally_third_russo_turkish_war_during_4_17_at_1634(Res) :- setof((Start,End),neg_finally_third_russo_turkish_war_during_4_17(Start,End),AllINtervals), checkvalidity(1634,AllINtervals,Res).

check_query() :- write('Query = neg_finally_third_russo_turkish_war_during_4_17_at_1634'), (neg_finally_third_russo_turkish_war_during_4_17_at_1634(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_third_russo_turkish_war_during_4_17_aux().

