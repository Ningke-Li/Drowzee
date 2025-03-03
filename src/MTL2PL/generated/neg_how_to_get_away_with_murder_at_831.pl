:- include('database.pl').
how_to_get_away_with_murder(Start,End) :- begin('how_to_get_away_with_murder',_,_,Start), end('how_to_get_away_with_murder',_,_,End), Start=<End.

compare_how_to_get_away_with_murder(Dir,how_to_get_away_with_murder(Start1,_),how_to_get_away_with_murder(Start2,_)) :- Start1=<Start2.

generate_neg_how_to_get_away_with_murder([]).

generate_neg_how_to_get_away_with_murder([(Start,End) | Tail]) :- assert(neg_how_to_get_away_with_murder(Start,End)), generate_neg_how_to_get_away_with_murder(Tail).

sort_how_to_get_away_with_murder(SortedIntervals) :- findall((Start,End),how_to_get_away_with_murder(Start,End),UnsortedIntervals), predsort(compare_how_to_get_away_with_murder,UnsortedIntervals,SortedIntervals).

generate_neg_how_to_get_away_with_murder_aux() :- sort_how_to_get_away_with_murder(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_how_to_get_away_with_murder(NegatedIntervals).

neg_how_to_get_away_with_murder_at_831(Res) :- setof((Start,End),neg_how_to_get_away_with_murder(Start,End),AllINtervals), checkvalidity(831,AllINtervals,Res).

check_query() :- write('Query = neg_how_to_get_away_with_murder_at_831'), (neg_how_to_get_away_with_murder_at_831(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_how_to_get_away_with_murder_aux().

