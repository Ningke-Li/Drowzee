:- include('database.pl').
battle_of_caporetto(Start,End) :- begin('battle_of_caporetto',_,_,Start), end('battle_of_caporetto',_,_,End), Start=<End.

compare_battle_of_caporetto(Dir,battle_of_caporetto(Start1,_),battle_of_caporetto(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_caporetto([]).

generate_neg_battle_of_caporetto([(Start,End) | Tail]) :- assert(neg_battle_of_caporetto(Start,End)), generate_neg_battle_of_caporetto(Tail).

sort_battle_of_caporetto(SortedIntervals) :- findall((Start,End),battle_of_caporetto(Start,End),UnsortedIntervals), predsort(compare_battle_of_caporetto,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_caporetto_aux() :- sort_battle_of_caporetto(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_caporetto(NegatedIntervals).

neg_battle_of_caporetto_at_1853(Res) :- setof((Start,End),neg_battle_of_caporetto(Start,End),AllINtervals), checkvalidity(1853,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_caporetto_at_1853'), (neg_battle_of_caporetto_at_1853(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_caporetto_aux().

