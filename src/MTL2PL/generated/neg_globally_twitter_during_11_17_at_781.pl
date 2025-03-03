:- include('database.pl').
twitter(Start,End) :- begin('twitter',_,_,Start), end('twitter',_,_,End), Start=<End.

globally_twitter_during_11_17(Start,End) :- twitter(Start1,End1), Start is (Start1-11), End is (End1-17), Start=<End.

compare_globally_twitter_during_11_17(Dir,globally_twitter_during_11_17(Start1,_),globally_twitter_during_11_17(Start2,_)) :- Start1=<Start2.

generate_neg_globally_twitter_during_11_17([]).

generate_neg_globally_twitter_during_11_17([(Start,End) | Tail]) :- assert(neg_globally_twitter_during_11_17(Start,End)), generate_neg_globally_twitter_during_11_17(Tail).

sort_globally_twitter_during_11_17(SortedIntervals) :- findall((Start,End),globally_twitter_during_11_17(Start,End),UnsortedIntervals), predsort(compare_globally_twitter_during_11_17,UnsortedIntervals,SortedIntervals).

generate_neg_globally_twitter_during_11_17_aux() :- sort_globally_twitter_during_11_17(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_twitter_during_11_17(NegatedIntervals).

neg_globally_twitter_during_11_17_at_781(Res) :- setof((Start,End),neg_globally_twitter_during_11_17(Start,End),AllINtervals), checkvalidity(781,AllINtervals,Res).

check_query() :- write('Query = neg_globally_twitter_during_11_17_at_781'), (neg_globally_twitter_during_11_17_at_781(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_twitter_during_11_17_aux().

