:- include('database.pl').
french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

french_franc_last_till_7_12(Start,End) :- french_franc(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

french_franc_until_belgian_franc_during_7_12_overlap(Start,End) :- french_franc_last_till_7_12(Start1,End1), belgian_franc(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

french_franc_until_belgian_franc_during_7_12(Start,End) :- french_franc(W1,_), french_franc_until_belgian_franc_during_7_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-7), Start=<End.

french_franc_until_belgian_franc_during_7_12_at_1719(Res) :- setof((Start,End),french_franc_until_belgian_franc_during_7_12(Start,End),AllINtervals), checkvalidity(1719,AllINtervals,Res).

check_query() :- write('Query = french_franc_until_belgian_franc_during_7_12_at_1719'), (french_franc_until_belgian_franc_during_7_12_at_1719(true) -> write('\nRes   = true');write('\nRes   = false')).

