:- include('database.pl').
tibet(Start,End) :- begin('tibet',_,_,Start), end('tibet',_,_,End), Start=<End.

tambov_rebellion(Start,End) :- begin('tambov_rebellion',_,_,Start), end('tambov_rebellion',_,_,End), Start=<End.

tibet_last_till_1_7(Start,End) :- tibet(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

tibet_until_tambov_rebellion_during_1_7_overlap(Start,End) :- tibet_last_till_1_7(Start1,End1), tambov_rebellion(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

tibet_until_tambov_rebellion_during_1_7(Start,End) :- tibet(W1,_), tibet_until_tambov_rebellion_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

tibet_until_tambov_rebellion_during_1_7_at_1920(Res) :- setof((Start,End),tibet_until_tambov_rebellion_during_1_7(Start,End),AllINtervals), checkvalidity(1920,AllINtervals,Res).

check_query() :- write('Query = tibet_until_tambov_rebellion_during_1_7_at_1920'), (tibet_until_tambov_rebellion_during_1_7_at_1920(true) -> write('\nRes   = true');write('\nRes   = false')).

