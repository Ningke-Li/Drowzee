:- include('database.pl').
brusilov_offensive(Start,End) :- begin('brusilov_offensive',_,_,Start), end('brusilov_offensive',_,_,End), Start=<End.

compare_brusilov_offensive(Dir,brusilov_offensive(Start1,_),brusilov_offensive(Start2,_)) :- Start1=<Start2.

generate_neg_brusilov_offensive([]).

generate_neg_brusilov_offensive([(Start,End) | Tail]) :- assert(neg_brusilov_offensive(Start,End)), generate_neg_brusilov_offensive(Tail).

sort_brusilov_offensive(SortedIntervals) :- findall((Start,End),brusilov_offensive(Start,End),UnsortedIntervals), predsort(compare_brusilov_offensive,UnsortedIntervals,SortedIntervals).

generate_neg_brusilov_offensive_aux() :- sort_brusilov_offensive(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_brusilov_offensive(NegatedIntervals).

neg_brusilov_offensive_at_1051(Res) :- setof((Start,End),neg_brusilov_offensive(Start,End),AllINtervals), checkvalidity(1051,AllINtervals,Res).

check_query() :- write('Query = neg_brusilov_offensive_at_1051'), (neg_brusilov_offensive_at_1051(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_brusilov_offensive_aux().

