:- include('database.pl').
person_of_interest(Start,End) :- begin('person_of_interest',_,_,Start), end('person_of_interest',_,_,End), Start=<End.

globally_person_of_interest_during_1_4(Start,End) :- person_of_interest(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

compare_globally_person_of_interest_during_1_4(Dir,globally_person_of_interest_during_1_4(Start1,_),globally_person_of_interest_during_1_4(Start2,_)) :- Start1=<Start2.

generate_neg_globally_person_of_interest_during_1_4([]).

generate_neg_globally_person_of_interest_during_1_4([(Start,End) | Tail]) :- assert(neg_globally_person_of_interest_during_1_4(Start,End)), generate_neg_globally_person_of_interest_during_1_4(Tail).

sort_globally_person_of_interest_during_1_4(SortedIntervals) :- findall((Start,End),globally_person_of_interest_during_1_4(Start,End),UnsortedIntervals), predsort(compare_globally_person_of_interest_during_1_4,UnsortedIntervals,SortedIntervals).

generate_neg_globally_person_of_interest_during_1_4_aux() :- sort_globally_person_of_interest_during_1_4(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_person_of_interest_during_1_4(NegatedIntervals).

neg_globally_person_of_interest_during_1_4_at_957(Res) :- setof((Start,End),neg_globally_person_of_interest_during_1_4(Start,End),AllINtervals), checkvalidity(957,AllINtervals,Res).

check_query() :- write('Query = neg_globally_person_of_interest_during_1_4_at_957'), (neg_globally_person_of_interest_during_1_4_at_957(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_person_of_interest_during_1_4_aux().

