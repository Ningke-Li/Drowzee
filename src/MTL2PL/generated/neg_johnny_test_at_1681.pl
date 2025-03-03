:- include('database.pl').
johnny_test(Start,End) :- begin('johnny_test',_,_,Start), end('johnny_test',_,_,End), Start=<End.

compare_johnny_test(Dir,johnny_test(Start1,_),johnny_test(Start2,_)) :- Start1=<Start2.

generate_neg_johnny_test([]).

generate_neg_johnny_test([(Start,End) | Tail]) :- assert(neg_johnny_test(Start,End)), generate_neg_johnny_test(Tail).

sort_johnny_test(SortedIntervals) :- findall((Start,End),johnny_test(Start,End),UnsortedIntervals), predsort(compare_johnny_test,UnsortedIntervals,SortedIntervals).

generate_neg_johnny_test_aux() :- sort_johnny_test(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_johnny_test(NegatedIntervals).

neg_johnny_test_at_1681(Res) :- setof((Start,End),neg_johnny_test(Start,End),AllINtervals), checkvalidity(1681,AllINtervals,Res).

check_query() :- write('Query = neg_johnny_test_at_1681'), (neg_johnny_test_at_1681(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_johnny_test_aux().

