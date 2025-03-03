:- include('database.pl').
yugoslav_dinar(Start,End) :- begin('yugoslav_dinar',_,_,Start), end('yugoslav_dinar',_,_,End), Start=<End.

indo_pakistani_war_of_1947_1948(Start,End) :- begin('indo_pakistani_war_of_1947_1948',_,_,Start), end('indo_pakistani_war_of_1947_1948',_,_,End), Start=<End.

yugoslav_dinar_last_till_7_8(Start,End) :- yugoslav_dinar(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

yugoslav_dinar_until_indo_pakistani_war_of_1947_1948_during_7_8_overlap(Start,End) :- yugoslav_dinar_last_till_7_8(Start1,End1), indo_pakistani_war_of_1947_1948(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

yugoslav_dinar_until_indo_pakistani_war_of_1947_1948_during_7_8(Start,End) :- yugoslav_dinar(W1,_), yugoslav_dinar_until_indo_pakistani_war_of_1947_1948_during_7_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-7), Start=<End.

yugoslav_dinar_until_indo_pakistani_war_of_1947_1948_during_7_8_at_1884(Res) :- setof((Start,End),yugoslav_dinar_until_indo_pakistani_war_of_1947_1948_during_7_8(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = yugoslav_dinar_until_indo_pakistani_war_of_1947_1948_during_7_8_at_1884'), (yugoslav_dinar_until_indo_pakistani_war_of_1947_1948_during_7_8_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).

