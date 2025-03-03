:- include('database.pl').
russo_persian_war_of_1722_23(Start,End) :- begin('russo_persian_war_of_1722_23',_,_,Start), end('russo_persian_war_of_1722_23',_,_,End), Start=<End.

compare_russo_persian_war_of_1722_23(Dir,russo_persian_war_of_1722_23(Start1,_),russo_persian_war_of_1722_23(Start2,_)) :- Start1=<Start2.

generate_neg_russo_persian_war_of_1722_23([]).

generate_neg_russo_persian_war_of_1722_23([(Start,End) | Tail]) :- assert(neg_russo_persian_war_of_1722_23(Start,End)), generate_neg_russo_persian_war_of_1722_23(Tail).

sort_russo_persian_war_of_1722_23(SortedIntervals) :- findall((Start,End),russo_persian_war_of_1722_23(Start,End),UnsortedIntervals), predsort(compare_russo_persian_war_of_1722_23,UnsortedIntervals,SortedIntervals).

generate_neg_russo_persian_war_of_1722_23_aux() :- sort_russo_persian_war_of_1722_23(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_russo_persian_war_of_1722_23(NegatedIntervals).

neg_russo_persian_war_of_1722_23_at_1956(Res) :- setof((Start,End),neg_russo_persian_war_of_1722_23(Start,End),AllINtervals), checkvalidity(1956,AllINtervals,Res).

check_query() :- write('Query = neg_russo_persian_war_of_1722_23_at_1956'), (neg_russo_persian_war_of_1722_23_at_1956(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_russo_persian_war_of_1722_23_aux().

