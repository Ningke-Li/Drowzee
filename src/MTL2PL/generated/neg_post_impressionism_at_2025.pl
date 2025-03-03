:- include('database.pl').
post_impressionism(Start,End) :- begin('post_impressionism',_,_,Start), end('post_impressionism',_,_,End), Start=<End.

compare_post_impressionism(Dir,post_impressionism(Start1,_),post_impressionism(Start2,_)) :- Start1=<Start2.

generate_neg_post_impressionism([]).

generate_neg_post_impressionism([(Start,End) | Tail]) :- assert(neg_post_impressionism(Start,End)), generate_neg_post_impressionism(Tail).

sort_post_impressionism(SortedIntervals) :- findall((Start,End),post_impressionism(Start,End),UnsortedIntervals), predsort(compare_post_impressionism,UnsortedIntervals,SortedIntervals).

generate_neg_post_impressionism_aux() :- sort_post_impressionism(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_post_impressionism(NegatedIntervals).

neg_post_impressionism_at_2025(Res) :- setof((Start,End),neg_post_impressionism(Start,End),AllINtervals), checkvalidity(2025,AllINtervals,Res).

check_query() :- write('Query = neg_post_impressionism_at_2025'), (neg_post_impressionism_at_2025(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_post_impressionism_aux().

