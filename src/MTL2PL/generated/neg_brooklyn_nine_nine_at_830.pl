:- include('database.pl').
brooklyn_nine_nine(Start,End) :- begin('brooklyn_nine_nine',_,_,Start), end('brooklyn_nine_nine',_,_,End), Start=<End.

compare_brooklyn_nine_nine(Dir,brooklyn_nine_nine(Start1,_),brooklyn_nine_nine(Start2,_)) :- Start1=<Start2.

generate_neg_brooklyn_nine_nine([]).

generate_neg_brooklyn_nine_nine([(Start,End) | Tail]) :- assert(neg_brooklyn_nine_nine(Start,End)), generate_neg_brooklyn_nine_nine(Tail).

sort_brooklyn_nine_nine(SortedIntervals) :- findall((Start,End),brooklyn_nine_nine(Start,End),UnsortedIntervals), predsort(compare_brooklyn_nine_nine,UnsortedIntervals,SortedIntervals).

generate_neg_brooklyn_nine_nine_aux() :- sort_brooklyn_nine_nine(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_brooklyn_nine_nine(NegatedIntervals).

neg_brooklyn_nine_nine_at_830(Res) :- setof((Start,End),neg_brooklyn_nine_nine(Start,End),AllINtervals), checkvalidity(830,AllINtervals,Res).

check_query() :- write('Query = neg_brooklyn_nine_nine_at_830'), (neg_brooklyn_nine_nine_at_830(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_brooklyn_nine_nine_aux().

