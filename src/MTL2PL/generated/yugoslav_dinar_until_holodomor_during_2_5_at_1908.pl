:- include('database.pl').
yugoslav_dinar(Start,End) :- begin('yugoslav_dinar',_,_,Start), end('yugoslav_dinar',_,_,End), Start=<End.

holodomor(Start,End) :- begin('holodomor',_,_,Start), end('holodomor',_,_,End), Start=<End.

yugoslav_dinar_last_till_2_5(Start,End) :- yugoslav_dinar(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

yugoslav_dinar_until_holodomor_during_2_5_overlap(Start,End) :- yugoslav_dinar_last_till_2_5(Start1,End1), holodomor(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

yugoslav_dinar_until_holodomor_during_2_5(Start,End) :- yugoslav_dinar(W1,_), yugoslav_dinar_until_holodomor_during_2_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-2), Start=<End.

yugoslav_dinar_until_holodomor_during_2_5_at_1908(Res) :- setof((Start,End),yugoslav_dinar_until_holodomor_during_2_5(Start,End),AllINtervals), checkvalidity(1908,AllINtervals,Res).

check_query() :- write('Query = yugoslav_dinar_until_holodomor_during_2_5_at_1908'), (yugoslav_dinar_until_holodomor_during_2_5_at_1908(true) -> write('\nRes   = true');write('\nRes   = false')).

