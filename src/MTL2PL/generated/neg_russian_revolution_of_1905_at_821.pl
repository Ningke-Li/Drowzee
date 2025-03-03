:- include('database.pl').
russian_revolution_of_1905(Start,End) :- begin('russian_revolution_of_1905',_,_,Start), end('russian_revolution_of_1905',_,_,End), Start=<End.

compare_russian_revolution_of_1905(Dir,russian_revolution_of_1905(Start1,_),russian_revolution_of_1905(Start2,_)) :- Start1=<Start2.

generate_neg_russian_revolution_of_1905([]).

generate_neg_russian_revolution_of_1905([(Start,End) | Tail]) :- assert(neg_russian_revolution_of_1905(Start,End)), generate_neg_russian_revolution_of_1905(Tail).

sort_russian_revolution_of_1905(SortedIntervals) :- findall((Start,End),russian_revolution_of_1905(Start,End),UnsortedIntervals), predsort(compare_russian_revolution_of_1905,UnsortedIntervals,SortedIntervals).

generate_neg_russian_revolution_of_1905_aux() :- sort_russian_revolution_of_1905(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_russian_revolution_of_1905(NegatedIntervals).

neg_russian_revolution_of_1905_at_821(Res) :- setof((Start,End),neg_russian_revolution_of_1905(Start,End),AllINtervals), checkvalidity(821,AllINtervals,Res).

check_query() :- write('Query = neg_russian_revolution_of_1905_at_821'), (neg_russian_revolution_of_1905_at_821(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_russian_revolution_of_1905_aux().

