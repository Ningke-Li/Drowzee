:- include('database.pl').
sustainable_development_goals(Start,End) :- begin('sustainable_development_goals',_,_,Start), end('sustainable_development_goals',_,_,End), Start=<End.

globally_sustainable_development_goals_during_12_14(Start,End) :- sustainable_development_goals(Start1,End1), Start is (Start1-12), End is (End1-14), Start=<End.

compare_globally_sustainable_development_goals_during_12_14(Dir,globally_sustainable_development_goals_during_12_14(Start1,_),globally_sustainable_development_goals_during_12_14(Start2,_)) :- Start1=<Start2.

generate_neg_globally_sustainable_development_goals_during_12_14([]).

generate_neg_globally_sustainable_development_goals_during_12_14([(Start,End) | Tail]) :- assert(neg_globally_sustainable_development_goals_during_12_14(Start,End)), generate_neg_globally_sustainable_development_goals_during_12_14(Tail).

sort_globally_sustainable_development_goals_during_12_14(SortedIntervals) :- findall((Start,End),globally_sustainable_development_goals_during_12_14(Start,End),UnsortedIntervals), predsort(compare_globally_sustainable_development_goals_during_12_14,UnsortedIntervals,SortedIntervals).

generate_neg_globally_sustainable_development_goals_during_12_14_aux() :- sort_globally_sustainable_development_goals_during_12_14(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_sustainable_development_goals_during_12_14(NegatedIntervals).

neg_globally_sustainable_development_goals_during_12_14_at_1986(Res) :- setof((Start,End),neg_globally_sustainable_development_goals_during_12_14(Start,End),AllINtervals), checkvalidity(1986,AllINtervals,Res).

check_query() :- write('Query = neg_globally_sustainable_development_goals_during_12_14_at_1986'), (neg_globally_sustainable_development_goals_during_12_14_at_1986(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_sustainable_development_goals_during_12_14_aux().

