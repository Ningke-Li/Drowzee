:- include('database.pl').
oh_my_ghostess(Start,End) :- begin('oh_my_ghostess',_,_,Start), end('oh_my_ghostess',_,_,End), Start=<End.

compare_oh_my_ghostess(Dir,oh_my_ghostess(Start1,_),oh_my_ghostess(Start2,_)) :- Start1=<Start2.

generate_neg_oh_my_ghostess([]).

generate_neg_oh_my_ghostess([(Start,End) | Tail]) :- assert(neg_oh_my_ghostess(Start,End)), generate_neg_oh_my_ghostess(Tail).

sort_oh_my_ghostess(SortedIntervals) :- findall((Start,End),oh_my_ghostess(Start,End),UnsortedIntervals), predsort(compare_oh_my_ghostess,UnsortedIntervals,SortedIntervals).

generate_neg_oh_my_ghostess_aux() :- sort_oh_my_ghostess(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_oh_my_ghostess(NegatedIntervals).

neg_oh_my_ghostess_at_1925(Res) :- setof((Start,End),neg_oh_my_ghostess(Start,End),AllINtervals), checkvalidity(1925,AllINtervals,Res).

check_query() :- write('Query = neg_oh_my_ghostess_at_1925'), (neg_oh_my_ghostess_at_1925(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_oh_my_ghostess_aux().

