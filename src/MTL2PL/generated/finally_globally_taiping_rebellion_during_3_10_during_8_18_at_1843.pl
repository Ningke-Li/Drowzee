:- include('database.pl').
taiping_rebellion(Start,End) :- begin('taiping_rebellion',_,_,Start), end('taiping_rebellion',_,_,End), Start=<End.

globally_taiping_rebellion_during_3_10(Start,End) :- taiping_rebellion(Start1,End1), Start is (Start1-3), End is (End1-10), Start=<End.

finally_globally_taiping_rebellion_during_3_10_during_8_18(Start,End) :- globally_taiping_rebellion_during_3_10(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_globally_taiping_rebellion_during_3_10_during_8_18_at_1843(Res) :- setof((Start,End),finally_globally_taiping_rebellion_during_3_10_during_8_18(Start,End),AllINtervals), checkvalidity(1843,AllINtervals,Res).

check_query() :- write('Query = finally_globally_taiping_rebellion_during_3_10_during_8_18_at_1843'), (finally_globally_taiping_rebellion_during_3_10_during_8_18_at_1843(true) -> write('\nRes   = true');write('\nRes   = false')).

