:- include('database.pl').
terra_nova_expedition(Start,End) :- begin('terra_nova_expedition',_,_,Start), end('terra_nova_expedition',_,_,End), Start=<End.

compare_terra_nova_expedition(Dir,terra_nova_expedition(Start1,_),terra_nova_expedition(Start2,_)) :- Start1=<Start2.

generate_neg_terra_nova_expedition([]).

generate_neg_terra_nova_expedition([(Start,End) | Tail]) :- assert(neg_terra_nova_expedition(Start,End)), generate_neg_terra_nova_expedition(Tail).

sort_terra_nova_expedition(SortedIntervals) :- findall((Start,End),terra_nova_expedition(Start,End),UnsortedIntervals), predsort(compare_terra_nova_expedition,UnsortedIntervals,SortedIntervals).

generate_neg_terra_nova_expedition_aux() :- sort_terra_nova_expedition(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_terra_nova_expedition(NegatedIntervals).

neg_terra_nova_expedition_at_1624(Res) :- setof((Start,End),neg_terra_nova_expedition(Start,End),AllINtervals), checkvalidity(1624,AllINtervals,Res).

check_query() :- write('Query = neg_terra_nova_expedition_at_1624'), (neg_terra_nova_expedition_at_1624(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_terra_nova_expedition_aux().

