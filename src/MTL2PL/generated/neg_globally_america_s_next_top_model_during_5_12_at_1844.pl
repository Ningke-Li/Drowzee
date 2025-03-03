:- include('database.pl').
america_s_next_top_model(Start,End) :- begin('america_s_next_top_model',_,_,Start), end('america_s_next_top_model',_,_,End), Start=<End.

globally_america_s_next_top_model_during_5_12(Start,End) :- america_s_next_top_model(Start1,End1), Start is (Start1-5), End is (End1-12), Start=<End.

compare_globally_america_s_next_top_model_during_5_12(Dir,globally_america_s_next_top_model_during_5_12(Start1,_),globally_america_s_next_top_model_during_5_12(Start2,_)) :- Start1=<Start2.

generate_neg_globally_america_s_next_top_model_during_5_12([]).

generate_neg_globally_america_s_next_top_model_during_5_12([(Start,End) | Tail]) :- assert(neg_globally_america_s_next_top_model_during_5_12(Start,End)), generate_neg_globally_america_s_next_top_model_during_5_12(Tail).

sort_globally_america_s_next_top_model_during_5_12(SortedIntervals) :- findall((Start,End),globally_america_s_next_top_model_during_5_12(Start,End),UnsortedIntervals), predsort(compare_globally_america_s_next_top_model_during_5_12,UnsortedIntervals,SortedIntervals).

generate_neg_globally_america_s_next_top_model_during_5_12_aux() :- sort_globally_america_s_next_top_model_during_5_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_america_s_next_top_model_during_5_12(NegatedIntervals).

neg_globally_america_s_next_top_model_during_5_12_at_1844(Res) :- setof((Start,End),neg_globally_america_s_next_top_model_during_5_12(Start,End),AllINtervals), checkvalidity(1844,AllINtervals,Res).

check_query() :- write('Query = neg_globally_america_s_next_top_model_during_5_12_at_1844'), (neg_globally_america_s_next_top_model_during_5_12_at_1844(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_america_s_next_top_model_during_5_12_aux().

