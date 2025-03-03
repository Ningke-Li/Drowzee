:- include('database.pl').
american_indian_wars(Start,End) :- begin('american_indian_wars',_,_,Start), end('american_indian_wars',_,_,End), Start=<End.

compare_american_indian_wars(Dir,american_indian_wars(Start1,_),american_indian_wars(Start2,_)) :- Start1=<Start2.

generate_neg_american_indian_wars([]).

generate_neg_american_indian_wars([(Start,End) | Tail]) :- assert(neg_american_indian_wars(Start,End)), generate_neg_american_indian_wars(Tail).

sort_american_indian_wars(SortedIntervals) :- findall((Start,End),american_indian_wars(Start,End),UnsortedIntervals), predsort(compare_american_indian_wars,UnsortedIntervals,SortedIntervals).

generate_neg_american_indian_wars_aux() :- sort_american_indian_wars(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_american_indian_wars(NegatedIntervals).

neg_american_indian_wars_at_757(Res) :- setof((Start,End),neg_american_indian_wars(Start,End),AllINtervals), checkvalidity(757,AllINtervals,Res).

check_query() :- write('Query = neg_american_indian_wars_at_757'), (neg_american_indian_wars_at_757(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_american_indian_wars_aux().

