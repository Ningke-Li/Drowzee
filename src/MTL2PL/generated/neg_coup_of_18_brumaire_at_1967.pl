:- include('database.pl').
coup_of_18_brumaire(Start,End) :- begin('coup_of_18_brumaire',_,_,Start), end('coup_of_18_brumaire',_,_,End), Start=<End.

compare_coup_of_18_brumaire(Dir,coup_of_18_brumaire(Start1,_),coup_of_18_brumaire(Start2,_)) :- Start1=<Start2.

generate_neg_coup_of_18_brumaire([]).

generate_neg_coup_of_18_brumaire([(Start,End) | Tail]) :- assert(neg_coup_of_18_brumaire(Start,End)), generate_neg_coup_of_18_brumaire(Tail).

sort_coup_of_18_brumaire(SortedIntervals) :- findall((Start,End),coup_of_18_brumaire(Start,End),UnsortedIntervals), predsort(compare_coup_of_18_brumaire,UnsortedIntervals,SortedIntervals).

generate_neg_coup_of_18_brumaire_aux() :- sort_coup_of_18_brumaire(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_coup_of_18_brumaire(NegatedIntervals).

neg_coup_of_18_brumaire_at_1967(Res) :- setof((Start,End),neg_coup_of_18_brumaire(Start,End),AllINtervals), checkvalidity(1967,AllINtervals,Res).

check_query() :- write('Query = neg_coup_of_18_brumaire_at_1967'), (neg_coup_of_18_brumaire_at_1967(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_coup_of_18_brumaire_aux().

