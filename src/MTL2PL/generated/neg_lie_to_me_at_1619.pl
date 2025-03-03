:- include('database.pl').
lie_to_me(Start,End) :- begin('lie_to_me',_,_,Start), end('lie_to_me',_,_,End), Start=<End.

compare_lie_to_me(Dir,lie_to_me(Start1,_),lie_to_me(Start2,_)) :- Start1=<Start2.

generate_neg_lie_to_me([]).

generate_neg_lie_to_me([(Start,End) | Tail]) :- assert(neg_lie_to_me(Start,End)), generate_neg_lie_to_me(Tail).

sort_lie_to_me(SortedIntervals) :- findall((Start,End),lie_to_me(Start,End),UnsortedIntervals), predsort(compare_lie_to_me,UnsortedIntervals,SortedIntervals).

generate_neg_lie_to_me_aux() :- sort_lie_to_me(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_lie_to_me(NegatedIntervals).

neg_lie_to_me_at_1619(Res) :- setof((Start,End),neg_lie_to_me(Start,End),AllINtervals), checkvalidity(1619,AllINtervals,Res).

check_query() :- write('Query = neg_lie_to_me_at_1619'), (neg_lie_to_me_at_1619(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_lie_to_me_aux().

