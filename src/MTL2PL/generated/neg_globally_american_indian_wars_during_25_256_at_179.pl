:- include('database.pl').
american_indian_wars(Start,End) :- begin('american_indian_wars',_,_,Start), end('american_indian_wars',_,_,End), Start=<End.

globally_american_indian_wars_during_25_256(Start,End) :- american_indian_wars(Start1,End1), Start is (Start1-25), End is (End1-256), Start=<End.

compare_globally_american_indian_wars_during_25_256(Dir,globally_american_indian_wars_during_25_256(Start1,_),globally_american_indian_wars_during_25_256(Start2,_)) :- Start1=<Start2.

generate_neg_globally_american_indian_wars_during_25_256([]).

generate_neg_globally_american_indian_wars_during_25_256([(Start,End) | Tail]) :- assert(neg_globally_american_indian_wars_during_25_256(Start,End)), generate_neg_globally_american_indian_wars_during_25_256(Tail).

sort_globally_american_indian_wars_during_25_256(SortedIntervals) :- findall((Start,End),globally_american_indian_wars_during_25_256(Start,End),UnsortedIntervals), predsort(compare_globally_american_indian_wars_during_25_256,UnsortedIntervals,SortedIntervals).

generate_neg_globally_american_indian_wars_during_25_256_aux() :- sort_globally_american_indian_wars_during_25_256(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_american_indian_wars_during_25_256(NegatedIntervals).

neg_globally_american_indian_wars_during_25_256_at_179(Res) :- setof((Start,End),neg_globally_american_indian_wars_during_25_256(Start,End),AllINtervals), checkvalidity(179,AllINtervals,Res).

check_query() :- write('Query = neg_globally_american_indian_wars_during_25_256_at_179'), (neg_globally_american_indian_wars_during_25_256_at_179(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_american_indian_wars_during_25_256_aux().

