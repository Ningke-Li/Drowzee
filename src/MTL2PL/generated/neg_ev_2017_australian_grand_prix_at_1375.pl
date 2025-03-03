:- include('database.pl').
ev_2017_australian_grand_prix(Start,End) :- begin('ev_2017_australian_grand_prix',_,_,Start), end('ev_2017_australian_grand_prix',_,_,End), Start=<End.

compare_ev_2017_australian_grand_prix(Dir,ev_2017_australian_grand_prix(Start1,_),ev_2017_australian_grand_prix(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2017_australian_grand_prix([]).

generate_neg_ev_2017_australian_grand_prix([(Start,End) | Tail]) :- assert(neg_ev_2017_australian_grand_prix(Start,End)), generate_neg_ev_2017_australian_grand_prix(Tail).

sort_ev_2017_australian_grand_prix(SortedIntervals) :- findall((Start,End),ev_2017_australian_grand_prix(Start,End),UnsortedIntervals), predsort(compare_ev_2017_australian_grand_prix,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2017_australian_grand_prix_aux() :- sort_ev_2017_australian_grand_prix(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2017_australian_grand_prix(NegatedIntervals).

neg_ev_2017_australian_grand_prix_at_1375(Res) :- setof((Start,End),neg_ev_2017_australian_grand_prix(Start,End),AllINtervals), checkvalidity(1375,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2017_australian_grand_prix_at_1375'), (neg_ev_2017_australian_grand_prix_at_1375(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2017_australian_grand_prix_aux().

