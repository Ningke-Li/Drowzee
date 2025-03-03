:- include('database.pl').
age_of_enlightenment(Start,End) :- begin('age_of_enlightenment',_,_,Start), end('age_of_enlightenment',_,_,End), Start=<End.

seven_years__war(Start,End) :- begin('seven_years__war',_,_,Start), end('seven_years__war',_,_,End), Start=<End.

age_of_enlightenment_last_till_16_22(Start,End) :- age_of_enlightenment(Start1,End1), (End1-Start1)>=16, Start is (Start1+16), End is (End1+1).

age_of_enlightenment_until_seven_years__war_during_16_22_overlap(Start,End) :- age_of_enlightenment_last_till_16_22(Start1,End1), seven_years__war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

age_of_enlightenment_until_seven_years__war_during_16_22(Start,End) :- age_of_enlightenment(W1,_), age_of_enlightenment_until_seven_years__war_during_16_22_overlap(Start1,End1), Start is max((Start1-22),W1), End is (End1-16), Start=<End.

age_of_enlightenment_until_seven_years__war_during_16_22_at_1603(Res) :- setof((Start,End),age_of_enlightenment_until_seven_years__war_during_16_22(Start,End),AllINtervals), checkvalidity(1603,AllINtervals,Res).

check_query() :- write('Query = age_of_enlightenment_until_seven_years__war_during_16_22_at_1603'), (age_of_enlightenment_until_seven_years__war_during_16_22_at_1603(true) -> write('\nRes   = true');write('\nRes   = false')).

