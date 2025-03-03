:- include('database.pl').
don_t_mess_with_an_angel(Start,End) :- begin('don_t_mess_with_an_angel',_,_,Start), end('don_t_mess_with_an_angel',_,_,End), Start=<End.

compare_don_t_mess_with_an_angel(Dir,don_t_mess_with_an_angel(Start1,_),don_t_mess_with_an_angel(Start2,_)) :- Start1=<Start2.

generate_neg_don_t_mess_with_an_angel([]).

generate_neg_don_t_mess_with_an_angel([(Start,End) | Tail]) :- assert(neg_don_t_mess_with_an_angel(Start,End)), generate_neg_don_t_mess_with_an_angel(Tail).

sort_don_t_mess_with_an_angel(SortedIntervals) :- findall((Start,End),don_t_mess_with_an_angel(Start,End),UnsortedIntervals), predsort(compare_don_t_mess_with_an_angel,UnsortedIntervals,SortedIntervals).

generate_neg_don_t_mess_with_an_angel_aux() :- sort_don_t_mess_with_an_angel(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_don_t_mess_with_an_angel(NegatedIntervals).

neg_don_t_mess_with_an_angel_at_1161(Res) :- setof((Start,End),neg_don_t_mess_with_an_angel(Start,End),AllINtervals), checkvalidity(1161,AllINtervals,Res).

check_query() :- write('Query = neg_don_t_mess_with_an_angel_at_1161'), (neg_don_t_mess_with_an_angel_at_1161(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_don_t_mess_with_an_angel_aux().

