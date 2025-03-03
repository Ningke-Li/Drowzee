:- include('database.pl').
persian_constitutional_revolution(Start,End) :- begin('persian_constitutional_revolution',_,_,Start), end('persian_constitutional_revolution',_,_,End), Start=<End.

compare_persian_constitutional_revolution(Dir,persian_constitutional_revolution(Start1,_),persian_constitutional_revolution(Start2,_)) :- Start1=<Start2.

generate_neg_persian_constitutional_revolution([]).

generate_neg_persian_constitutional_revolution([(Start,End) | Tail]) :- assert(neg_persian_constitutional_revolution(Start,End)), generate_neg_persian_constitutional_revolution(Tail).

sort_persian_constitutional_revolution(SortedIntervals) :- findall((Start,End),persian_constitutional_revolution(Start,End),UnsortedIntervals), predsort(compare_persian_constitutional_revolution,UnsortedIntervals,SortedIntervals).

generate_neg_persian_constitutional_revolution_aux() :- sort_persian_constitutional_revolution(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_persian_constitutional_revolution(NegatedIntervals).

neg_persian_constitutional_revolution_at_1180(Res) :- setof((Start,End),neg_persian_constitutional_revolution(Start,End),AllINtervals), checkvalidity(1180,AllINtervals,Res).

check_query() :- write('Query = neg_persian_constitutional_revolution_at_1180'), (neg_persian_constitutional_revolution_at_1180(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_persian_constitutional_revolution_aux().

