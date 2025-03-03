:- include('database.pl').
ev_1928_winter_olympics(Start,End) :- begin('ev_1928_winter_olympics',_,_,Start), end('ev_1928_winter_olympics',_,_,End), Start=<End.

compare_ev_1928_winter_olympics(Dir,ev_1928_winter_olympics(Start1,_),ev_1928_winter_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1928_winter_olympics([]).

generate_neg_ev_1928_winter_olympics([(Start,End) | Tail]) :- assert(neg_ev_1928_winter_olympics(Start,End)), generate_neg_ev_1928_winter_olympics(Tail).

sort_ev_1928_winter_olympics(SortedIntervals) :- findall((Start,End),ev_1928_winter_olympics(Start,End),UnsortedIntervals), predsort(compare_ev_1928_winter_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1928_winter_olympics_aux() :- sort_ev_1928_winter_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1928_winter_olympics(NegatedIntervals).

neg_ev_1928_winter_olympics_at_1341(Res) :- setof((Start,End),neg_ev_1928_winter_olympics(Start,End),AllINtervals), checkvalidity(1341,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1928_winter_olympics_at_1341'), (neg_ev_1928_winter_olympics_at_1341(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1928_winter_olympics_aux().

