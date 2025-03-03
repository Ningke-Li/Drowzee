:- include('database.pl').
french_revolution(Start,End) :- begin('french_revolution',_,_,Start), end('french_revolution',_,_,End), Start=<End.

compare_french_revolution(Dir,french_revolution(Start1,_),french_revolution(Start2,_)) :- Start1=<Start2.

generate_neg_french_revolution([]).

generate_neg_french_revolution([(Start,End) | Tail]) :- assert(neg_french_revolution(Start,End)), generate_neg_french_revolution(Tail).

sort_french_revolution(SortedIntervals) :- findall((Start,End),french_revolution(Start,End),UnsortedIntervals), predsort(compare_french_revolution,UnsortedIntervals,SortedIntervals).

generate_neg_french_revolution_aux() :- sort_french_revolution(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_french_revolution(NegatedIntervals).

neg_french_revolution_at_1809(Res) :- setof((Start,End),neg_french_revolution(Start,End),AllINtervals), checkvalidity(1809,AllINtervals,Res).

check_query() :- write('Query = neg_french_revolution_at_1809'), (neg_french_revolution_at_1809(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_french_revolution_aux().

