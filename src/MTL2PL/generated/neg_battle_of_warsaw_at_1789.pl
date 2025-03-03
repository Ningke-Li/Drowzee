:- include('database.pl').
battle_of_warsaw(Start,End) :- begin('battle_of_warsaw',_,_,Start), end('battle_of_warsaw',_,_,End), Start=<End.

compare_battle_of_warsaw(Dir,battle_of_warsaw(Start1,_),battle_of_warsaw(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_warsaw([]).

generate_neg_battle_of_warsaw([(Start,End) | Tail]) :- assert(neg_battle_of_warsaw(Start,End)), generate_neg_battle_of_warsaw(Tail).

sort_battle_of_warsaw(SortedIntervals) :- findall((Start,End),battle_of_warsaw(Start,End),UnsortedIntervals), predsort(compare_battle_of_warsaw,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_warsaw_aux() :- sort_battle_of_warsaw(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_warsaw(NegatedIntervals).

neg_battle_of_warsaw_at_1789(Res) :- setof((Start,End),neg_battle_of_warsaw(Start,End),AllINtervals), checkvalidity(1789,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_warsaw_at_1789'), (neg_battle_of_warsaw_at_1789(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_warsaw_aux().

