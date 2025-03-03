:- include('database.pl').
battle_of_okinawa(Start,End) :- begin('battle_of_okinawa',_,_,Start), end('battle_of_okinawa',_,_,End), Start=<End.

compare_battle_of_okinawa(Dir,battle_of_okinawa(Start1,_),battle_of_okinawa(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_okinawa([]).

generate_neg_battle_of_okinawa([(Start,End) | Tail]) :- assert(neg_battle_of_okinawa(Start,End)), generate_neg_battle_of_okinawa(Tail).

sort_battle_of_okinawa(SortedIntervals) :- findall((Start,End),battle_of_okinawa(Start,End),UnsortedIntervals), predsort(compare_battle_of_okinawa,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_okinawa_aux() :- sort_battle_of_okinawa(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_okinawa(NegatedIntervals).

neg_battle_of_okinawa_at_742(Res) :- setof((Start,End),neg_battle_of_okinawa(Start,End),AllINtervals), checkvalidity(742,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_okinawa_at_742'), (neg_battle_of_okinawa_at_742(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_okinawa_aux().

