:- include('database.pl').
battle_of_berezina(Start,End) :- begin('battle_of_berezina',_,_,Start), end('battle_of_berezina',_,_,End), Start=<End.

compare_battle_of_berezina(Dir,battle_of_berezina(Start1,_),battle_of_berezina(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_berezina([]).

generate_neg_battle_of_berezina([(Start,End) | Tail]) :- assert(neg_battle_of_berezina(Start,End)), generate_neg_battle_of_berezina(Tail).

sort_battle_of_berezina(SortedIntervals) :- findall((Start,End),battle_of_berezina(Start,End),UnsortedIntervals), predsort(compare_battle_of_berezina,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_berezina_aux() :- sort_battle_of_berezina(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_berezina(NegatedIntervals).

neg_battle_of_berezina_at_558(Res) :- setof((Start,End),neg_battle_of_berezina(Start,End),AllINtervals), checkvalidity(558,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_berezina_at_558'), (neg_battle_of_berezina_at_558(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_berezina_aux().

