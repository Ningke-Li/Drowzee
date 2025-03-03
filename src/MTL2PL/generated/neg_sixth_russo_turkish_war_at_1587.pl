:- include('database.pl').
sixth_russo_turkish_war(Start,End) :- begin('sixth_russo_turkish_war',_,_,Start), end('sixth_russo_turkish_war',_,_,End), Start=<End.

compare_sixth_russo_turkish_war(Dir,sixth_russo_turkish_war(Start1,_),sixth_russo_turkish_war(Start2,_)) :- Start1=<Start2.

generate_neg_sixth_russo_turkish_war([]).

generate_neg_sixth_russo_turkish_war([(Start,End) | Tail]) :- assert(neg_sixth_russo_turkish_war(Start,End)), generate_neg_sixth_russo_turkish_war(Tail).

sort_sixth_russo_turkish_war(SortedIntervals) :- findall((Start,End),sixth_russo_turkish_war(Start,End),UnsortedIntervals), predsort(compare_sixth_russo_turkish_war,UnsortedIntervals,SortedIntervals).

generate_neg_sixth_russo_turkish_war_aux() :- sort_sixth_russo_turkish_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_sixth_russo_turkish_war(NegatedIntervals).

neg_sixth_russo_turkish_war_at_1587(Res) :- setof((Start,End),neg_sixth_russo_turkish_war(Start,End),AllINtervals), checkvalidity(1587,AllINtervals,Res).

check_query() :- write('Query = neg_sixth_russo_turkish_war_at_1587'), (neg_sixth_russo_turkish_war_at_1587(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_sixth_russo_turkish_war_aux().

