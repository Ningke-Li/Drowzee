:- include('database.pl').
carnatic_wars(Start,End) :- begin('carnatic_wars',_,_,Start), end('carnatic_wars',_,_,End), Start=<End.

globally_carnatic_wars_during_3_11(Start,End) :- carnatic_wars(Start1,End1), Start is (Start1-3), End is (End1-11), Start=<End.

compare_globally_carnatic_wars_during_3_11(Dir,globally_carnatic_wars_during_3_11(Start1,_),globally_carnatic_wars_during_3_11(Start2,_)) :- Start1=<Start2.

generate_neg_globally_carnatic_wars_during_3_11([]).

generate_neg_globally_carnatic_wars_during_3_11([(Start,End) | Tail]) :- assert(neg_globally_carnatic_wars_during_3_11(Start,End)), generate_neg_globally_carnatic_wars_during_3_11(Tail).

sort_globally_carnatic_wars_during_3_11(SortedIntervals) :- findall((Start,End),globally_carnatic_wars_during_3_11(Start,End),UnsortedIntervals), predsort(compare_globally_carnatic_wars_during_3_11,UnsortedIntervals,SortedIntervals).

generate_neg_globally_carnatic_wars_during_3_11_aux() :- sort_globally_carnatic_wars_during_3_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_carnatic_wars_during_3_11(NegatedIntervals).

neg_globally_carnatic_wars_during_3_11_at_1617(Res) :- setof((Start,End),neg_globally_carnatic_wars_during_3_11(Start,End),AllINtervals), checkvalidity(1617,AllINtervals,Res).

check_query() :- write('Query = neg_globally_carnatic_wars_during_3_11_at_1617'), (neg_globally_carnatic_wars_during_3_11_at_1617(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_carnatic_wars_during_3_11_aux().

