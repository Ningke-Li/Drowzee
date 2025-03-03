:- include('database.pl').
person_of_interest(Start,End) :- begin('person_of_interest',_,_,Start), end('person_of_interest',_,_,End), Start=<End.

finally_person_of_interest_during_5_20(Start,End) :- person_of_interest(Start1,End1), (Start1-20)=<(End1-5), Start is (Start1-20), End is (End1-5), Start=<End.

finally_person_of_interest_during_5_20_at_1997(Res) :- setof((Start,End),finally_person_of_interest_during_5_20(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = finally_person_of_interest_during_5_20_at_1997'), (finally_person_of_interest_during_5_20_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

