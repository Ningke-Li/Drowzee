:- include('database.pl').
famine_in_kazakhstan_of_1932_33(Start,End) :- begin('famine_in_kazakhstan_of_1932_33',_,_,Start), end('famine_in_kazakhstan_of_1932_33',_,_,End), Start=<End.

compare_famine_in_kazakhstan_of_1932_33(Dir,famine_in_kazakhstan_of_1932_33(Start1,_),famine_in_kazakhstan_of_1932_33(Start2,_)) :- Start1=<Start2.

generate_neg_famine_in_kazakhstan_of_1932_33([]).

generate_neg_famine_in_kazakhstan_of_1932_33([(Start,End) | Tail]) :- assert(neg_famine_in_kazakhstan_of_1932_33(Start,End)), generate_neg_famine_in_kazakhstan_of_1932_33(Tail).

sort_famine_in_kazakhstan_of_1932_33(SortedIntervals) :- findall((Start,End),famine_in_kazakhstan_of_1932_33(Start,End),UnsortedIntervals), predsort(compare_famine_in_kazakhstan_of_1932_33,UnsortedIntervals,SortedIntervals).

generate_neg_famine_in_kazakhstan_of_1932_33_aux() :- sort_famine_in_kazakhstan_of_1932_33(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_famine_in_kazakhstan_of_1932_33(NegatedIntervals).

neg_famine_in_kazakhstan_of_1932_33_at_1807(Res) :- setof((Start,End),neg_famine_in_kazakhstan_of_1932_33(Start,End),AllINtervals), checkvalidity(1807,AllINtervals,Res).

check_query() :- write('Query = neg_famine_in_kazakhstan_of_1932_33_at_1807'), (neg_famine_in_kazakhstan_of_1932_33_at_1807(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_famine_in_kazakhstan_of_1932_33_aux().

