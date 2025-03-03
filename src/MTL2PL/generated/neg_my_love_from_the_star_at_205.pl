:- include('database.pl').
my_love_from_the_star(Start,End) :- begin('my_love_from_the_star',_,_,Start), end('my_love_from_the_star',_,_,End), Start=<End.

compare_my_love_from_the_star(Dir,my_love_from_the_star(Start1,_),my_love_from_the_star(Start2,_)) :- Start1=<Start2.

generate_neg_my_love_from_the_star([]).

generate_neg_my_love_from_the_star([(Start,End) | Tail]) :- assert(neg_my_love_from_the_star(Start,End)), generate_neg_my_love_from_the_star(Tail).

sort_my_love_from_the_star(SortedIntervals) :- findall((Start,End),my_love_from_the_star(Start,End),UnsortedIntervals), predsort(compare_my_love_from_the_star,UnsortedIntervals,SortedIntervals).

generate_neg_my_love_from_the_star_aux() :- sort_my_love_from_the_star(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_my_love_from_the_star(NegatedIntervals).

neg_my_love_from_the_star_at_205(Res) :- setof((Start,End),neg_my_love_from_the_star(Start,End),AllINtervals), checkvalidity(205,AllINtervals,Res).

check_query() :- write('Query = neg_my_love_from_the_star_at_205'), (neg_my_love_from_the_star_at_205(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_my_love_from_the_star_aux().

