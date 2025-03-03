:- include('database.pl').
ev_1928_summer_olympics(Start,End) :- begin('ev_1928_summer_olympics',_,_,Start), end('ev_1928_summer_olympics',_,_,End), Start=<End.

compare_ev_1928_summer_olympics(Dir,ev_1928_summer_olympics(Start1,_),ev_1928_summer_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1928_summer_olympics([]).

generate_neg_ev_1928_summer_olympics([(Start,End) | Tail]) :- assert(neg_ev_1928_summer_olympics(Start,End)), generate_neg_ev_1928_summer_olympics(Tail).

sort_ev_1928_summer_olympics(SortedIntervals) :- findall((Start,End),ev_1928_summer_olympics(Start,End),UnsortedIntervals), predsort(compare_ev_1928_summer_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1928_summer_olympics_aux() :- sort_ev_1928_summer_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1928_summer_olympics(NegatedIntervals).

neg_ev_1928_summer_olympics_at_209(Res) :- setof((Start,End),neg_ev_1928_summer_olympics(Start,End),AllINtervals), checkvalidity(209,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1928_summer_olympics_at_209'), (neg_ev_1928_summer_olympics_at_209(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1928_summer_olympics_aux().

