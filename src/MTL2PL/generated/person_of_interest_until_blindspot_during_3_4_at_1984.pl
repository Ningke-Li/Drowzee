:- include('database.pl').
person_of_interest(Start,End) :- begin('person_of_interest',_,_,Start), end('person_of_interest',_,_,End), Start=<End.

blindspot(Start,End) :- begin('blindspot',_,_,Start), end('blindspot',_,_,End), Start=<End.

person_of_interest_last_till_3_4(Start,End) :- person_of_interest(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

person_of_interest_until_blindspot_during_3_4_overlap(Start,End) :- person_of_interest_last_till_3_4(Start1,End1), blindspot(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

person_of_interest_until_blindspot_during_3_4(Start,End) :- person_of_interest(W1,_), person_of_interest_until_blindspot_during_3_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-3), Start=<End.

person_of_interest_until_blindspot_during_3_4_at_1984(Res) :- setof((Start,End),person_of_interest_until_blindspot_during_3_4(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = person_of_interest_until_blindspot_during_3_4_at_1984'), (person_of_interest_until_blindspot_during_3_4_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).

