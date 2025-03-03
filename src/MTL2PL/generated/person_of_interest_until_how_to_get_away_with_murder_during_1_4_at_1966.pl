:- include('database.pl').
person_of_interest(Start,End) :- begin('person_of_interest',_,_,Start), end('person_of_interest',_,_,End), Start=<End.

how_to_get_away_with_murder(Start,End) :- begin('how_to_get_away_with_murder',_,_,Start), end('how_to_get_away_with_murder',_,_,End), Start=<End.

person_of_interest_last_till_1_4(Start,End) :- person_of_interest(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

person_of_interest_until_how_to_get_away_with_murder_during_1_4_overlap(Start,End) :- person_of_interest_last_till_1_4(Start1,End1), how_to_get_away_with_murder(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

person_of_interest_until_how_to_get_away_with_murder_during_1_4(Start,End) :- person_of_interest(W1,_), person_of_interest_until_how_to_get_away_with_murder_during_1_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-1), Start=<End.

person_of_interest_until_how_to_get_away_with_murder_during_1_4_at_1966(Res) :- setof((Start,End),person_of_interest_until_how_to_get_away_with_murder_during_1_4(Start,End),AllINtervals), checkvalidity(1966,AllINtervals,Res).

check_query() :- write('Query = person_of_interest_until_how_to_get_away_with_murder_during_1_4_at_1966'), (person_of_interest_until_how_to_get_away_with_murder_during_1_4_at_1966(true) -> write('\nRes   = true');write('\nRes   = false')).

