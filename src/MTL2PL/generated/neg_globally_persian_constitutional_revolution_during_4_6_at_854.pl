:- include('database.pl').
persian_constitutional_revolution(Start,End) :- begin('persian_constitutional_revolution',_,_,Start), end('persian_constitutional_revolution',_,_,End), Start=<End.

globally_persian_constitutional_revolution_during_4_6(Start,End) :- persian_constitutional_revolution(Start1,End1), Start is (Start1-4), End is (End1-6), Start=<End.

compare_globally_persian_constitutional_revolution_during_4_6(Dir,globally_persian_constitutional_revolution_during_4_6(Start1,_),globally_persian_constitutional_revolution_during_4_6(Start2,_)) :- Start1=<Start2.

generate_neg_globally_persian_constitutional_revolution_during_4_6([]).

generate_neg_globally_persian_constitutional_revolution_during_4_6([(Start,End) | Tail]) :- assert(neg_globally_persian_constitutional_revolution_during_4_6(Start,End)), generate_neg_globally_persian_constitutional_revolution_during_4_6(Tail).

sort_globally_persian_constitutional_revolution_during_4_6(SortedIntervals) :- findall((Start,End),globally_persian_constitutional_revolution_during_4_6(Start,End),UnsortedIntervals), predsort(compare_globally_persian_constitutional_revolution_during_4_6,UnsortedIntervals,SortedIntervals).

generate_neg_globally_persian_constitutional_revolution_during_4_6_aux() :- sort_globally_persian_constitutional_revolution_during_4_6(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_persian_constitutional_revolution_during_4_6(NegatedIntervals).

neg_globally_persian_constitutional_revolution_during_4_6_at_854(Res) :- setof((Start,End),neg_globally_persian_constitutional_revolution_during_4_6(Start,End),AllINtervals), checkvalidity(854,AllINtervals,Res).

check_query() :- write('Query = neg_globally_persian_constitutional_revolution_during_4_6_at_854'), (neg_globally_persian_constitutional_revolution_during_4_6_at_854(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_persian_constitutional_revolution_during_4_6_aux().

