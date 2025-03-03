:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

the_cleveland_show(Start,End) :- begin('the_cleveland_show',_,_,Start), end('the_cleveland_show',_,_,End), Start=<End.

vostok_programme_last_till_7_11(Start,End) :- vostok_programme(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

vostok_programme_until_the_cleveland_show_during_7_11_overlap(Start,End) :- vostok_programme_last_till_7_11(Start1,End1), the_cleveland_show(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

vostok_programme_until_the_cleveland_show_during_7_11(Start,End) :- vostok_programme(W1,_), vostok_programme_until_the_cleveland_show_during_7_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-7), Start=<End.

vostok_programme_until_the_cleveland_show_during_7_11_at_1871(Res) :- setof((Start,End),vostok_programme_until_the_cleveland_show_during_7_11(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = vostok_programme_until_the_cleveland_show_during_7_11_at_1871'), (vostok_programme_until_the_cleveland_show_during_7_11_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).

