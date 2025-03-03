:- include('database.pl').
turkish_war_of_independence(Start,End) :- begin('turkish_war_of_independence',_,_,Start), end('turkish_war_of_independence',_,_,End), Start=<End.

globally_turkish_war_of_independence_during_1_3(Start,End) :- turkish_war_of_independence(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

compare_globally_turkish_war_of_independence_during_1_3(Dir,globally_turkish_war_of_independence_during_1_3(Start1,_),globally_turkish_war_of_independence_during_1_3(Start2,_)) :- Start1=<Start2.

generate_neg_globally_turkish_war_of_independence_during_1_3([]).

generate_neg_globally_turkish_war_of_independence_during_1_3([(Start,End) | Tail]) :- assert(neg_globally_turkish_war_of_independence_during_1_3(Start,End)), generate_neg_globally_turkish_war_of_independence_during_1_3(Tail).

sort_globally_turkish_war_of_independence_during_1_3(SortedIntervals) :- findall((Start,End),globally_turkish_war_of_independence_during_1_3(Start,End),UnsortedIntervals), predsort(compare_globally_turkish_war_of_independence_during_1_3,UnsortedIntervals,SortedIntervals).

generate_neg_globally_turkish_war_of_independence_during_1_3_aux() :- sort_globally_turkish_war_of_independence_during_1_3(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_turkish_war_of_independence_during_1_3(NegatedIntervals).

neg_globally_turkish_war_of_independence_during_1_3_at_156(Res) :- setof((Start,End),neg_globally_turkish_war_of_independence_during_1_3(Start,End),AllINtervals), checkvalidity(156,AllINtervals,Res).

check_query() :- write('Query = neg_globally_turkish_war_of_independence_during_1_3_at_156'), (neg_globally_turkish_war_of_independence_during_1_3_at_156(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_turkish_war_of_independence_during_1_3_aux().

