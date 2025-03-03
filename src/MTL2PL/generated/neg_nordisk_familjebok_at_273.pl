:- include('database.pl').
nordisk_familjebok(Start,End) :- begin('nordisk_familjebok',_,_,Start), end('nordisk_familjebok',_,_,End), Start=<End.

compare_nordisk_familjebok(Dir,nordisk_familjebok(Start1,_),nordisk_familjebok(Start2,_)) :- Start1=<Start2.

generate_neg_nordisk_familjebok([]).

generate_neg_nordisk_familjebok([(Start,End) | Tail]) :- assert(neg_nordisk_familjebok(Start,End)), generate_neg_nordisk_familjebok(Tail).

sort_nordisk_familjebok(SortedIntervals) :- findall((Start,End),nordisk_familjebok(Start,End),UnsortedIntervals), predsort(compare_nordisk_familjebok,UnsortedIntervals,SortedIntervals).

generate_neg_nordisk_familjebok_aux() :- sort_nordisk_familjebok(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_nordisk_familjebok(NegatedIntervals).

neg_nordisk_familjebok_at_273(Res) :- setof((Start,End),neg_nordisk_familjebok(Start,End),AllINtervals), checkvalidity(273,AllINtervals,Res).

check_query() :- write('Query = neg_nordisk_familjebok_at_273'), (neg_nordisk_familjebok_at_273(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_nordisk_familjebok_aux().

