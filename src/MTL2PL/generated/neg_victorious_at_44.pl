:- include('database.pl').
victorious(Start,End) :- begin('victorious',_,_,Start), end('victorious',_,_,End), Start=<End.

compare_victorious(Dir,victorious(Start1,_),victorious(Start2,_)) :- Start1=<Start2.

generate_neg_victorious([]).

generate_neg_victorious([(Start,End) | Tail]) :- assert(neg_victorious(Start,End)), generate_neg_victorious(Tail).

sort_victorious(SortedIntervals) :- findall((Start,End),victorious(Start,End),UnsortedIntervals), predsort(compare_victorious,UnsortedIntervals,SortedIntervals).

generate_neg_victorious_aux() :- sort_victorious(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_victorious(NegatedIntervals).

neg_victorious_at_44(Res) :- setof((Start,End),neg_victorious(Start,End),AllINtervals), checkvalidity(44,AllINtervals,Res).

check_query() :- write('Query = neg_victorious_at_44'), (neg_victorious_at_44(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_victorious_aux().

