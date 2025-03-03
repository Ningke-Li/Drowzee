:- include('database.pl').
battle_of_dien_bien_phu(Start,End) :- begin('battle_of_dien_bien_phu',_,_,Start), end('battle_of_dien_bien_phu',_,_,End), Start=<End.

compare_battle_of_dien_bien_phu(Dir,battle_of_dien_bien_phu(Start1,_),battle_of_dien_bien_phu(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_dien_bien_phu([]).

generate_neg_battle_of_dien_bien_phu([(Start,End) | Tail]) :- assert(neg_battle_of_dien_bien_phu(Start,End)), generate_neg_battle_of_dien_bien_phu(Tail).

sort_battle_of_dien_bien_phu(SortedIntervals) :- findall((Start,End),battle_of_dien_bien_phu(Start,End),UnsortedIntervals), predsort(compare_battle_of_dien_bien_phu,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_dien_bien_phu_aux() :- sort_battle_of_dien_bien_phu(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_dien_bien_phu(NegatedIntervals).

neg_battle_of_dien_bien_phu_at_187(Res) :- setof((Start,End),neg_battle_of_dien_bien_phu(Start,End),AllINtervals), checkvalidity(187,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_dien_bien_phu_at_187'), (neg_battle_of_dien_bien_phu_at_187(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_dien_bien_phu_aux().

