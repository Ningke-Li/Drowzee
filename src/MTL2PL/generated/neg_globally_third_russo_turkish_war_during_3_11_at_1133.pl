:- include('database.pl').
third_russo_turkish_war(Start,End) :- begin('third_russo_turkish_war',_,_,Start), end('third_russo_turkish_war',_,_,End), Start=<End.

globally_third_russo_turkish_war_during_3_11(Start,End) :- third_russo_turkish_war(Start1,End1), Start is (Start1-3), End is (End1-11), Start=<End.

compare_globally_third_russo_turkish_war_during_3_11(Dir,globally_third_russo_turkish_war_during_3_11(Start1,_),globally_third_russo_turkish_war_during_3_11(Start2,_)) :- Start1=<Start2.

generate_neg_globally_third_russo_turkish_war_during_3_11([]).

generate_neg_globally_third_russo_turkish_war_during_3_11([(Start,End) | Tail]) :- assert(neg_globally_third_russo_turkish_war_during_3_11(Start,End)), generate_neg_globally_third_russo_turkish_war_during_3_11(Tail).

sort_globally_third_russo_turkish_war_during_3_11(SortedIntervals) :- findall((Start,End),globally_third_russo_turkish_war_during_3_11(Start,End),UnsortedIntervals), predsort(compare_globally_third_russo_turkish_war_during_3_11,UnsortedIntervals,SortedIntervals).

generate_neg_globally_third_russo_turkish_war_during_3_11_aux() :- sort_globally_third_russo_turkish_war_during_3_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_third_russo_turkish_war_during_3_11(NegatedIntervals).

neg_globally_third_russo_turkish_war_during_3_11_at_1133(Res) :- setof((Start,End),neg_globally_third_russo_turkish_war_during_3_11(Start,End),AllINtervals), checkvalidity(1133,AllINtervals,Res).

check_query() :- write('Query = neg_globally_third_russo_turkish_war_during_3_11_at_1133'), (neg_globally_third_russo_turkish_war_during_3_11_at_1133(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_third_russo_turkish_war_during_3_11_aux().

