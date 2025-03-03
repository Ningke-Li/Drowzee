:- include('database.pl').
star_wars__clone_wars(Start,End) :- begin('star_wars__clone_wars',_,_,Start), end('star_wars__clone_wars',_,_,End), Start=<End.

compare_star_wars__clone_wars(Dir,star_wars__clone_wars(Start1,_),star_wars__clone_wars(Start2,_)) :- Start1=<Start2.

generate_neg_star_wars__clone_wars([]).

generate_neg_star_wars__clone_wars([(Start,End) | Tail]) :- assert(neg_star_wars__clone_wars(Start,End)), generate_neg_star_wars__clone_wars(Tail).

sort_star_wars__clone_wars(SortedIntervals) :- findall((Start,End),star_wars__clone_wars(Start,End),UnsortedIntervals), predsort(compare_star_wars__clone_wars,UnsortedIntervals,SortedIntervals).

generate_neg_star_wars__clone_wars_aux() :- sort_star_wars__clone_wars(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_star_wars__clone_wars(NegatedIntervals).

neg_star_wars__clone_wars_at_1907(Res) :- setof((Start,End),neg_star_wars__clone_wars(Start,End),AllINtervals), checkvalidity(1907,AllINtervals,Res).

check_query() :- write('Query = neg_star_wars__clone_wars_at_1907'), (neg_star_wars__clone_wars_at_1907(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_star_wars__clone_wars_aux().

