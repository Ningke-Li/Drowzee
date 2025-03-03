:- include('database.pl').
eighth_russo_turkish_war(Start,End) :- begin('eighth_russo_turkish_war',_,_,Start), end('eighth_russo_turkish_war',_,_,End), Start=<End.

compare_eighth_russo_turkish_war(Dir,eighth_russo_turkish_war(Start1,_),eighth_russo_turkish_war(Start2,_)) :- Start1=<Start2.

generate_neg_eighth_russo_turkish_war([]).

generate_neg_eighth_russo_turkish_war([(Start,End) | Tail]) :- assert(neg_eighth_russo_turkish_war(Start,End)), generate_neg_eighth_russo_turkish_war(Tail).

sort_eighth_russo_turkish_war(SortedIntervals) :- findall((Start,End),eighth_russo_turkish_war(Start,End),UnsortedIntervals), predsort(compare_eighth_russo_turkish_war,UnsortedIntervals,SortedIntervals).

generate_neg_eighth_russo_turkish_war_aux() :- sort_eighth_russo_turkish_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_eighth_russo_turkish_war(NegatedIntervals).

neg_eighth_russo_turkish_war_at_1735(Res) :- setof((Start,End),neg_eighth_russo_turkish_war(Start,End),AllINtervals), checkvalidity(1735,AllINtervals,Res).

check_query() :- write('Query = neg_eighth_russo_turkish_war_at_1735'), (neg_eighth_russo_turkish_war_at_1735(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_eighth_russo_turkish_war_aux().

