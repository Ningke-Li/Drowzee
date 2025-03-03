:- include('database.pl').
criminal_minds(Start,End) :- begin('criminal_minds',_,_,Start), end('criminal_minds',_,_,End), Start=<End.

under_the_dome(Start,End) :- begin('under_the_dome',_,_,Start), end('under_the_dome',_,_,End), Start=<End.

criminal_minds_last_till_1_7(Start,End) :- criminal_minds(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

criminal_minds_until_under_the_dome_during_1_7_overlap(Start,End) :- criminal_minds_last_till_1_7(Start1,End1), under_the_dome(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

criminal_minds_until_under_the_dome_during_1_7(Start,End) :- criminal_minds(W1,_), criminal_minds_until_under_the_dome_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

criminal_minds_until_under_the_dome_during_1_7_at_1870(Res) :- setof((Start,End),criminal_minds_until_under_the_dome_during_1_7(Start,End),AllINtervals), checkvalidity(1870,AllINtervals,Res).

check_query() :- write('Query = criminal_minds_until_under_the_dome_during_1_7_at_1870'), (criminal_minds_until_under_the_dome_during_1_7_at_1870(true) -> write('\nRes   = true');write('\nRes   = false')).

