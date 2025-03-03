:- include('database.pl').
salvadoran_col_n(Start,End) :- begin('salvadoran_col_n',_,_,Start), end('salvadoran_col_n',_,_,End), Start=<End.

globally_salvadoran_col_n_during_39_76(Start,End) :- salvadoran_col_n(Start1,End1), Start is (Start1-39), End is (End1-76), Start=<End.

compare_globally_salvadoran_col_n_during_39_76(Dir,globally_salvadoran_col_n_during_39_76(Start1,_),globally_salvadoran_col_n_during_39_76(Start2,_)) :- Start1=<Start2.

generate_neg_globally_salvadoran_col_n_during_39_76([]).

generate_neg_globally_salvadoran_col_n_during_39_76([(Start,End) | Tail]) :- assert(neg_globally_salvadoran_col_n_during_39_76(Start,End)), generate_neg_globally_salvadoran_col_n_during_39_76(Tail).

sort_globally_salvadoran_col_n_during_39_76(SortedIntervals) :- findall((Start,End),globally_salvadoran_col_n_during_39_76(Start,End),UnsortedIntervals), predsort(compare_globally_salvadoran_col_n_during_39_76,UnsortedIntervals,SortedIntervals).

generate_neg_globally_salvadoran_col_n_during_39_76_aux() :- sort_globally_salvadoran_col_n_during_39_76(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_salvadoran_col_n_during_39_76(NegatedIntervals).

neg_globally_salvadoran_col_n_during_39_76_at_453(Res) :- setof((Start,End),neg_globally_salvadoran_col_n_during_39_76(Start,End),AllINtervals), checkvalidity(453,AllINtervals,Res).

check_query() :- write('Query = neg_globally_salvadoran_col_n_during_39_76_at_453'), (neg_globally_salvadoran_col_n_during_39_76_at_453(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_salvadoran_col_n_during_39_76_aux().

