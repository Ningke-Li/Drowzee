:- include('database.pl').
ninth_russo_turkish_war(Start,End) :- begin('ninth_russo_turkish_war',_,_,Start), end('ninth_russo_turkish_war',_,_,End), Start=<End.

compare_ninth_russo_turkish_war(Dir,ninth_russo_turkish_war(Start1,_),ninth_russo_turkish_war(Start2,_)) :- Start1=<Start2.

generate_neg_ninth_russo_turkish_war([]).

generate_neg_ninth_russo_turkish_war([(Start,End) | Tail]) :- assert(neg_ninth_russo_turkish_war(Start,End)), generate_neg_ninth_russo_turkish_war(Tail).

sort_ninth_russo_turkish_war(SortedIntervals) :- findall((Start,End),ninth_russo_turkish_war(Start,End),UnsortedIntervals), predsort(compare_ninth_russo_turkish_war,UnsortedIntervals,SortedIntervals).

generate_neg_ninth_russo_turkish_war_aux() :- sort_ninth_russo_turkish_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ninth_russo_turkish_war(NegatedIntervals).

neg_ninth_russo_turkish_war_at_933(Res) :- setof((Start,End),neg_ninth_russo_turkish_war(Start,End),AllINtervals), checkvalidity(933,AllINtervals,Res).

check_query() :- write('Query = neg_ninth_russo_turkish_war_at_933'), (neg_ninth_russo_turkish_war_at_933(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ninth_russo_turkish_war_aux().

