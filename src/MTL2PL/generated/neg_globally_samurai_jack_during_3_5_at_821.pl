:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

globally_samurai_jack_during_3_5(Start,End) :- samurai_jack(Start1,End1), Start is (Start1-3), End is (End1-5), Start=<End.

compare_globally_samurai_jack_during_3_5(Dir,globally_samurai_jack_during_3_5(Start1,_),globally_samurai_jack_during_3_5(Start2,_)) :- Start1=<Start2.

generate_neg_globally_samurai_jack_during_3_5([]).

generate_neg_globally_samurai_jack_during_3_5([(Start,End) | Tail]) :- assert(neg_globally_samurai_jack_during_3_5(Start,End)), generate_neg_globally_samurai_jack_during_3_5(Tail).

sort_globally_samurai_jack_during_3_5(SortedIntervals) :- findall((Start,End),globally_samurai_jack_during_3_5(Start,End),UnsortedIntervals), predsort(compare_globally_samurai_jack_during_3_5,UnsortedIntervals,SortedIntervals).

generate_neg_globally_samurai_jack_during_3_5_aux() :- sort_globally_samurai_jack_during_3_5(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_samurai_jack_during_3_5(NegatedIntervals).

neg_globally_samurai_jack_during_3_5_at_821(Res) :- setof((Start,End),neg_globally_samurai_jack_during_3_5(Start,End),AllINtervals), checkvalidity(821,AllINtervals,Res).

check_query() :- write('Query = neg_globally_samurai_jack_during_3_5_at_821'), (neg_globally_samurai_jack_during_3_5_at_821(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_samurai_jack_during_3_5_aux().

