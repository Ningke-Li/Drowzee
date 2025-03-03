:- include('database.pl').
drake___josh(Start,End) :- begin('drake___josh',_,_,Start), end('drake___josh',_,_,End), Start=<End.

compare_drake___josh(Dir,drake___josh(Start1,_),drake___josh(Start2,_)) :- Start1=<Start2.

generate_neg_drake___josh([]).

generate_neg_drake___josh([(Start,End) | Tail]) :- assert(neg_drake___josh(Start,End)), generate_neg_drake___josh(Tail).

sort_drake___josh(SortedIntervals) :- findall((Start,End),drake___josh(Start,End),UnsortedIntervals), predsort(compare_drake___josh,UnsortedIntervals,SortedIntervals).

generate_neg_drake___josh_aux() :- sort_drake___josh(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_drake___josh(NegatedIntervals).

neg_drake___josh_at_1324(Res) :- setof((Start,End),neg_drake___josh(Start,End),AllINtervals), checkvalidity(1324,AllINtervals,Res).

check_query() :- write('Query = neg_drake___josh_at_1324'), (neg_drake___josh_at_1324(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_drake___josh_aux().

