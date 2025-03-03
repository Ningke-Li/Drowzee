:- include('database.pl').
second_russo_turkish_war(Start,End) :- begin('second_russo_turkish_war',_,_,Start), end('second_russo_turkish_war',_,_,End), Start=<End.

compare_second_russo_turkish_war(Dir,second_russo_turkish_war(Start1,_),second_russo_turkish_war(Start2,_)) :- Start1=<Start2.

generate_neg_second_russo_turkish_war([]).

generate_neg_second_russo_turkish_war([(Start,End) | Tail]) :- assert(neg_second_russo_turkish_war(Start,End)), generate_neg_second_russo_turkish_war(Tail).

sort_second_russo_turkish_war(SortedIntervals) :- findall((Start,End),second_russo_turkish_war(Start,End),UnsortedIntervals), predsort(compare_second_russo_turkish_war,UnsortedIntervals,SortedIntervals).

generate_neg_second_russo_turkish_war_aux() :- sort_second_russo_turkish_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_second_russo_turkish_war(NegatedIntervals).

neg_second_russo_turkish_war_at_1188(Res) :- setof((Start,End),neg_second_russo_turkish_war(Start,End),AllINtervals), checkvalidity(1188,AllINtervals,Res).

check_query() :- write('Query = neg_second_russo_turkish_war_at_1188'), (neg_second_russo_turkish_war_at_1188(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_second_russo_turkish_war_aux().

