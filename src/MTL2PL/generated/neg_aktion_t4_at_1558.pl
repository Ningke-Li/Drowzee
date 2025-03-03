:- include('database.pl').
aktion_t4(Start,End) :- begin('aktion_t4',_,_,Start), end('aktion_t4',_,_,End), Start=<End.

compare_aktion_t4(Dir,aktion_t4(Start1,_),aktion_t4(Start2,_)) :- Start1=<Start2.

generate_neg_aktion_t4([]).

generate_neg_aktion_t4([(Start,End) | Tail]) :- assert(neg_aktion_t4(Start,End)), generate_neg_aktion_t4(Tail).

sort_aktion_t4(SortedIntervals) :- findall((Start,End),aktion_t4(Start,End),UnsortedIntervals), predsort(compare_aktion_t4,UnsortedIntervals,SortedIntervals).

generate_neg_aktion_t4_aux() :- sort_aktion_t4(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_aktion_t4(NegatedIntervals).

neg_aktion_t4_at_1558(Res) :- setof((Start,End),neg_aktion_t4(Start,End),AllINtervals), checkvalidity(1558,AllINtervals,Res).

check_query() :- write('Query = neg_aktion_t4_at_1558'), (neg_aktion_t4_at_1558(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_aktion_t4_aux().

