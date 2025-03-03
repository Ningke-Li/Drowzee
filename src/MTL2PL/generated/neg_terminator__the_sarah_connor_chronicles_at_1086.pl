:- include('database.pl').
terminator__the_sarah_connor_chronicles(Start,End) :- begin('terminator__the_sarah_connor_chronicles',_,_,Start), end('terminator__the_sarah_connor_chronicles',_,_,End), Start=<End.

compare_terminator__the_sarah_connor_chronicles(Dir,terminator__the_sarah_connor_chronicles(Start1,_),terminator__the_sarah_connor_chronicles(Start2,_)) :- Start1=<Start2.

generate_neg_terminator__the_sarah_connor_chronicles([]).

generate_neg_terminator__the_sarah_connor_chronicles([(Start,End) | Tail]) :- assert(neg_terminator__the_sarah_connor_chronicles(Start,End)), generate_neg_terminator__the_sarah_connor_chronicles(Tail).

sort_terminator__the_sarah_connor_chronicles(SortedIntervals) :- findall((Start,End),terminator__the_sarah_connor_chronicles(Start,End),UnsortedIntervals), predsort(compare_terminator__the_sarah_connor_chronicles,UnsortedIntervals,SortedIntervals).

generate_neg_terminator__the_sarah_connor_chronicles_aux() :- sort_terminator__the_sarah_connor_chronicles(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_terminator__the_sarah_connor_chronicles(NegatedIntervals).

neg_terminator__the_sarah_connor_chronicles_at_1086(Res) :- setof((Start,End),neg_terminator__the_sarah_connor_chronicles(Start,End),AllINtervals), checkvalidity(1086,AllINtervals,Res).

check_query() :- write('Query = neg_terminator__the_sarah_connor_chronicles_at_1086'), (neg_terminator__the_sarah_connor_chronicles_at_1086(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_terminator__the_sarah_connor_chronicles_aux().

