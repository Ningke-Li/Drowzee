:- include('database.pl').
yugoslav_dinar(Start,End) :- begin('yugoslav_dinar',_,_,Start), end('yugoslav_dinar',_,_,End), Start=<End.

east_german_mark(Start,End) :- begin('east_german_mark',_,_,Start), end('east_german_mark',_,_,End), Start=<End.

yugoslav_dinar_last_till_6_14(Start,End) :- yugoslav_dinar(Start1,End1), (End1-Start1)>=6, Start is (Start1+6), End is (End1+1).

yugoslav_dinar_until_east_german_mark_during_6_14_overlap(Start,End) :- yugoslav_dinar_last_till_6_14(Start1,End1), east_german_mark(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

yugoslav_dinar_until_east_german_mark_during_6_14(Start,End) :- yugoslav_dinar(W1,_), yugoslav_dinar_until_east_german_mark_during_6_14_overlap(Start1,End1), Start is max((Start1-14),W1), End is (End1-6), Start=<End.

yugoslav_dinar_until_east_german_mark_during_6_14_at_1976(Res) :- setof((Start,End),yugoslav_dinar_until_east_german_mark_during_6_14(Start,End),AllINtervals), checkvalidity(1976,AllINtervals,Res).

check_query() :- write('Query = yugoslav_dinar_until_east_german_mark_during_6_14_at_1976'), (yugoslav_dinar_until_east_german_mark_during_6_14_at_1976(true) -> write('\nRes   = true');write('\nRes   = false')).

