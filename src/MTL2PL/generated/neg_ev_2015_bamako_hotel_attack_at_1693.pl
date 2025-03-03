:- include('database.pl').
ev_2015_bamako_hotel_attack(Start,End) :- begin('ev_2015_bamako_hotel_attack',_,_,Start), end('ev_2015_bamako_hotel_attack',_,_,End), Start=<End.

compare_ev_2015_bamako_hotel_attack(Dir,ev_2015_bamako_hotel_attack(Start1,_),ev_2015_bamako_hotel_attack(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2015_bamako_hotel_attack([]).

generate_neg_ev_2015_bamako_hotel_attack([(Start,End) | Tail]) :- assert(neg_ev_2015_bamako_hotel_attack(Start,End)), generate_neg_ev_2015_bamako_hotel_attack(Tail).

sort_ev_2015_bamako_hotel_attack(SortedIntervals) :- findall((Start,End),ev_2015_bamako_hotel_attack(Start,End),UnsortedIntervals), predsort(compare_ev_2015_bamako_hotel_attack,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2015_bamako_hotel_attack_aux() :- sort_ev_2015_bamako_hotel_attack(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2015_bamako_hotel_attack(NegatedIntervals).

neg_ev_2015_bamako_hotel_attack_at_1693(Res) :- setof((Start,End),neg_ev_2015_bamako_hotel_attack(Start,End),AllINtervals), checkvalidity(1693,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2015_bamako_hotel_attack_at_1693'), (neg_ev_2015_bamako_hotel_attack_at_1693(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2015_bamako_hotel_attack_aux().

