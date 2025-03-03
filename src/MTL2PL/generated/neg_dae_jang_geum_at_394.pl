:- include('database.pl').
dae_jang_geum(Start,End) :- begin('dae_jang_geum',_,_,Start), end('dae_jang_geum',_,_,End), Start=<End.

compare_dae_jang_geum(Dir,dae_jang_geum(Start1,_),dae_jang_geum(Start2,_)) :- Start1=<Start2.

generate_neg_dae_jang_geum([]).

generate_neg_dae_jang_geum([(Start,End) | Tail]) :- assert(neg_dae_jang_geum(Start,End)), generate_neg_dae_jang_geum(Tail).

sort_dae_jang_geum(SortedIntervals) :- findall((Start,End),dae_jang_geum(Start,End),UnsortedIntervals), predsort(compare_dae_jang_geum,UnsortedIntervals,SortedIntervals).

generate_neg_dae_jang_geum_aux() :- sort_dae_jang_geum(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_dae_jang_geum(NegatedIntervals).

neg_dae_jang_geum_at_394(Res) :- setof((Start,End),neg_dae_jang_geum(Start,End),AllINtervals), checkvalidity(394,AllINtervals,Res).

check_query() :- write('Query = neg_dae_jang_geum_at_394'), (neg_dae_jang_geum_at_394(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_dae_jang_geum_aux().

