:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

bates_motel(Start,End) :- begin('bates_motel',_,_,Start), end('bates_motel',_,_,End), Start=<End.

vostok_programme_last_till_8_10(Start,End) :- vostok_programme(Start1,End1), (End1-Start1)>=8, Start is (Start1+8), End is (End1+1).

vostok_programme_until_bates_motel_during_8_10_overlap(Start,End) :- vostok_programme_last_till_8_10(Start1,End1), bates_motel(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

vostok_programme_until_bates_motel_during_8_10(Start,End) :- vostok_programme(W1,_), vostok_programme_until_bates_motel_during_8_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-8), Start=<End.

vostok_programme_until_bates_motel_during_8_10_at_1945(Res) :- setof((Start,End),vostok_programme_until_bates_motel_during_8_10(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = vostok_programme_until_bates_motel_during_8_10_at_1945'), (vostok_programme_until_bates_motel_during_8_10_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).

