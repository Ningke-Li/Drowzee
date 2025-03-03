:- include('database.pl').
star_wars_rebels(Start,End) :- begin('star_wars_rebels',_,_,Start), end('star_wars_rebels',_,_,End), Start=<End.

compare_star_wars_rebels(Dir,star_wars_rebels(Start1,_),star_wars_rebels(Start2,_)) :- Start1=<Start2.

generate_neg_star_wars_rebels([]).

generate_neg_star_wars_rebels([(Start,End) | Tail]) :- assert(neg_star_wars_rebels(Start,End)), generate_neg_star_wars_rebels(Tail).

sort_star_wars_rebels(SortedIntervals) :- findall((Start,End),star_wars_rebels(Start,End),UnsortedIntervals), predsort(compare_star_wars_rebels,UnsortedIntervals,SortedIntervals).

generate_neg_star_wars_rebels_aux() :- sort_star_wars_rebels(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_star_wars_rebels(NegatedIntervals).

neg_star_wars_rebels_at_1417(Res) :- setof((Start,End),neg_star_wars_rebels(Start,End),AllINtervals), checkvalidity(1417,AllINtervals,Res).

check_query() :- write('Query = neg_star_wars_rebels_at_1417'), (neg_star_wars_rebels_at_1417(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_star_wars_rebels_aux().

