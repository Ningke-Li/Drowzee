:- include('database.pl').
ev_1957_1958_influenza_pandemic(Start,End) :- begin('ev_1957_1958_influenza_pandemic',_,_,Start), end('ev_1957_1958_influenza_pandemic',_,_,End), Start=<End.

compare_ev_1957_1958_influenza_pandemic(Dir,ev_1957_1958_influenza_pandemic(Start1,_),ev_1957_1958_influenza_pandemic(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1957_1958_influenza_pandemic([]).

generate_neg_ev_1957_1958_influenza_pandemic([(Start,End) | Tail]) :- assert(neg_ev_1957_1958_influenza_pandemic(Start,End)), generate_neg_ev_1957_1958_influenza_pandemic(Tail).

sort_ev_1957_1958_influenza_pandemic(SortedIntervals) :- findall((Start,End),ev_1957_1958_influenza_pandemic(Start,End),UnsortedIntervals), predsort(compare_ev_1957_1958_influenza_pandemic,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1957_1958_influenza_pandemic_aux() :- sort_ev_1957_1958_influenza_pandemic(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1957_1958_influenza_pandemic(NegatedIntervals).

neg_ev_1957_1958_influenza_pandemic_at_1283(Res) :- setof((Start,End),neg_ev_1957_1958_influenza_pandemic(Start,End),AllINtervals), checkvalidity(1283,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1957_1958_influenza_pandemic_at_1283'), (neg_ev_1957_1958_influenza_pandemic_at_1283(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1957_1958_influenza_pandemic_aux().

