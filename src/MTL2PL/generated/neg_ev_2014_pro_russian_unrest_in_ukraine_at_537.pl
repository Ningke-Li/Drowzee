:- include('database.pl').
ev_2014_pro_russian_unrest_in_ukraine(Start,End) :- begin('ev_2014_pro_russian_unrest_in_ukraine',_,_,Start), end('ev_2014_pro_russian_unrest_in_ukraine',_,_,End), Start=<End.

compare_ev_2014_pro_russian_unrest_in_ukraine(Dir,ev_2014_pro_russian_unrest_in_ukraine(Start1,_),ev_2014_pro_russian_unrest_in_ukraine(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2014_pro_russian_unrest_in_ukraine([]).

generate_neg_ev_2014_pro_russian_unrest_in_ukraine([(Start,End) | Tail]) :- assert(neg_ev_2014_pro_russian_unrest_in_ukraine(Start,End)), generate_neg_ev_2014_pro_russian_unrest_in_ukraine(Tail).

sort_ev_2014_pro_russian_unrest_in_ukraine(SortedIntervals) :- findall((Start,End),ev_2014_pro_russian_unrest_in_ukraine(Start,End),UnsortedIntervals), predsort(compare_ev_2014_pro_russian_unrest_in_ukraine,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2014_pro_russian_unrest_in_ukraine_aux() :- sort_ev_2014_pro_russian_unrest_in_ukraine(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2014_pro_russian_unrest_in_ukraine(NegatedIntervals).

neg_ev_2014_pro_russian_unrest_in_ukraine_at_537(Res) :- setof((Start,End),neg_ev_2014_pro_russian_unrest_in_ukraine(Start,End),AllINtervals), checkvalidity(537,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2014_pro_russian_unrest_in_ukraine_at_537'), (neg_ev_2014_pro_russian_unrest_in_ukraine_at_537(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2014_pro_russian_unrest_in_ukraine_aux().

