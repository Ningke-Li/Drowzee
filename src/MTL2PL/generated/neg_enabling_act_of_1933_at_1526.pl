:- include('database.pl').
enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

compare_enabling_act_of_1933(Dir,enabling_act_of_1933(Start1,_),enabling_act_of_1933(Start2,_)) :- Start1=<Start2.

generate_neg_enabling_act_of_1933([]).

generate_neg_enabling_act_of_1933([(Start,End) | Tail]) :- assert(neg_enabling_act_of_1933(Start,End)), generate_neg_enabling_act_of_1933(Tail).

sort_enabling_act_of_1933(SortedIntervals) :- findall((Start,End),enabling_act_of_1933(Start,End),UnsortedIntervals), predsort(compare_enabling_act_of_1933,UnsortedIntervals,SortedIntervals).

generate_neg_enabling_act_of_1933_aux() :- sort_enabling_act_of_1933(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_enabling_act_of_1933(NegatedIntervals).

neg_enabling_act_of_1933_at_1526(Res) :- setof((Start,End),neg_enabling_act_of_1933(Start,End),AllINtervals), checkvalidity(1526,AllINtervals,Res).

check_query() :- write('Query = neg_enabling_act_of_1933_at_1526'), (neg_enabling_act_of_1933_at_1526(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_enabling_act_of_1933_aux().

