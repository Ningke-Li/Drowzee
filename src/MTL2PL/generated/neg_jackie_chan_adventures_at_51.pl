:- include('database.pl').
jackie_chan_adventures(Start,End) :- begin('jackie_chan_adventures',_,_,Start), end('jackie_chan_adventures',_,_,End), Start=<End.

compare_jackie_chan_adventures(Dir,jackie_chan_adventures(Start1,_),jackie_chan_adventures(Start2,_)) :- Start1=<Start2.

generate_neg_jackie_chan_adventures([]).

generate_neg_jackie_chan_adventures([(Start,End) | Tail]) :- assert(neg_jackie_chan_adventures(Start,End)), generate_neg_jackie_chan_adventures(Tail).

sort_jackie_chan_adventures(SortedIntervals) :- findall((Start,End),jackie_chan_adventures(Start,End),UnsortedIntervals), predsort(compare_jackie_chan_adventures,UnsortedIntervals,SortedIntervals).

generate_neg_jackie_chan_adventures_aux() :- sort_jackie_chan_adventures(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_jackie_chan_adventures(NegatedIntervals).

neg_jackie_chan_adventures_at_51(Res) :- setof((Start,End),neg_jackie_chan_adventures(Start,End),AllINtervals), checkvalidity(51,AllINtervals,Res).

check_query() :- write('Query = neg_jackie_chan_adventures_at_51'), (neg_jackie_chan_adventures_at_51(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_jackie_chan_adventures_aux().

