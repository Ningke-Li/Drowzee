:- include('database.pl').
yalta_conference(Start,End) :- begin('yalta_conference',_,_,Start), end('yalta_conference',_,_,End), Start=<End.

compare_yalta_conference(Dir,yalta_conference(Start1,_),yalta_conference(Start2,_)) :- Start1=<Start2.

generate_neg_yalta_conference([]).

generate_neg_yalta_conference([(Start,End) | Tail]) :- assert(neg_yalta_conference(Start,End)), generate_neg_yalta_conference(Tail).

sort_yalta_conference(SortedIntervals) :- findall((Start,End),yalta_conference(Start,End),UnsortedIntervals), predsort(compare_yalta_conference,UnsortedIntervals,SortedIntervals).

generate_neg_yalta_conference_aux() :- sort_yalta_conference(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_yalta_conference(NegatedIntervals).

neg_yalta_conference_at_409(Res) :- setof((Start,End),neg_yalta_conference(Start,End),AllINtervals), checkvalidity(409,AllINtervals,Res).

check_query() :- write('Query = neg_yalta_conference_at_409'), (neg_yalta_conference_at_409(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_yalta_conference_aux().

