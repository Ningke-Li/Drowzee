:- include('database.pl').
age_of_enlightenment(Start,End) :- begin('age_of_enlightenment',_,_,Start), end('age_of_enlightenment',_,_,End), Start=<End.

pax_britannica(Start,End) :- begin('pax_britannica',_,_,Start), end('pax_britannica',_,_,End), Start=<End.

age_of_enlightenment_last_till_32_35(Start,End) :- age_of_enlightenment(Start1,End1), (End1-Start1)>=32, Start is (Start1+32), End is (End1+1).

age_of_enlightenment_until_pax_britannica_during_32_35_overlap(Start,End) :- age_of_enlightenment_last_till_32_35(Start1,End1), pax_britannica(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

age_of_enlightenment_until_pax_britannica_during_32_35(Start,End) :- age_of_enlightenment(W1,_), age_of_enlightenment_until_pax_britannica_during_32_35_overlap(Start1,End1), Start is max((Start1-35),W1), End is (End1-32), Start=<End.

age_of_enlightenment_until_pax_britannica_during_32_35_at_1769(Res) :- setof((Start,End),age_of_enlightenment_until_pax_britannica_during_32_35(Start,End),AllINtervals), checkvalidity(1769,AllINtervals,Res).

check_query() :- write('Query = age_of_enlightenment_until_pax_britannica_during_32_35_at_1769'), (age_of_enlightenment_until_pax_britannica_during_32_35_at_1769(true) -> write('\nRes   = true');write('\nRes   = false')).

