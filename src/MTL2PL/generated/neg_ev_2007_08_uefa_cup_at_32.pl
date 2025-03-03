:- include('database.pl').
ev_2007_08_uefa_cup(Start,End) :- begin('ev_2007_08_uefa_cup',_,_,Start), end('ev_2007_08_uefa_cup',_,_,End), Start=<End.

compare_ev_2007_08_uefa_cup(Dir,ev_2007_08_uefa_cup(Start1,_),ev_2007_08_uefa_cup(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2007_08_uefa_cup([]).

generate_neg_ev_2007_08_uefa_cup([(Start,End) | Tail]) :- assert(neg_ev_2007_08_uefa_cup(Start,End)), generate_neg_ev_2007_08_uefa_cup(Tail).

sort_ev_2007_08_uefa_cup(SortedIntervals) :- findall((Start,End),ev_2007_08_uefa_cup(Start,End),UnsortedIntervals), predsort(compare_ev_2007_08_uefa_cup,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2007_08_uefa_cup_aux() :- sort_ev_2007_08_uefa_cup(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2007_08_uefa_cup(NegatedIntervals).

neg_ev_2007_08_uefa_cup_at_32(Res) :- setof((Start,End),neg_ev_2007_08_uefa_cup(Start,End),AllINtervals), checkvalidity(32,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2007_08_uefa_cup_at_32'), (neg_ev_2007_08_uefa_cup_at_32(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2007_08_uefa_cup_aux().

