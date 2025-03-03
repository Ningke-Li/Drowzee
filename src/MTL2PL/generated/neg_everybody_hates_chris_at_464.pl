:- include('database.pl').
everybody_hates_chris(Start,End) :- begin('everybody_hates_chris',_,_,Start), end('everybody_hates_chris',_,_,End), Start=<End.

compare_everybody_hates_chris(Dir,everybody_hates_chris(Start1,_),everybody_hates_chris(Start2,_)) :- Start1=<Start2.

generate_neg_everybody_hates_chris([]).

generate_neg_everybody_hates_chris([(Start,End) | Tail]) :- assert(neg_everybody_hates_chris(Start,End)), generate_neg_everybody_hates_chris(Tail).

sort_everybody_hates_chris(SortedIntervals) :- findall((Start,End),everybody_hates_chris(Start,End),UnsortedIntervals), predsort(compare_everybody_hates_chris,UnsortedIntervals,SortedIntervals).

generate_neg_everybody_hates_chris_aux() :- sort_everybody_hates_chris(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_everybody_hates_chris(NegatedIntervals).

neg_everybody_hates_chris_at_464(Res) :- setof((Start,End),neg_everybody_hates_chris(Start,End),AllINtervals), checkvalidity(464,AllINtervals,Res).

check_query() :- write('Query = neg_everybody_hates_chris_at_464'), (neg_everybody_hates_chris_at_464(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_everybody_hates_chris_aux().

