:- include('database.pl').
person_of_interest(Start,End) :- begin('person_of_interest',_,_,Start), end('person_of_interest',_,_,End), Start=<End.

globally_person_of_interest_during_1_3(Start,End) :- person_of_interest(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_person_of_interest_during_1_3(Start,End) :- globally_person_of_interest_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_person_of_interest_during_1_3_at_1962(Res) :- setof((Start,End),next_globally_person_of_interest_during_1_3(Start,End),AllINtervals), checkvalidity(1962,AllINtervals,Res).

check_query() :- write('Query = next_globally_person_of_interest_during_1_3_at_1962'), (next_globally_person_of_interest_during_1_3_at_1962(true) -> write('\nRes   = true');write('\nRes   = false')).

