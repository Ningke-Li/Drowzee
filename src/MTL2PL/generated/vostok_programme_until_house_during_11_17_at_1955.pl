:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

house(Start,End) :- begin('house',_,_,Start), end('house',_,_,End), Start=<End.

vostok_programme_last_till_11_17(Start,End) :- vostok_programme(Start1,End1), (End1-Start1)>=11, Start is (Start1+11), End is (End1+1).

vostok_programme_until_house_during_11_17_overlap(Start,End) :- vostok_programme_last_till_11_17(Start1,End1), house(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

vostok_programme_until_house_during_11_17(Start,End) :- vostok_programme(W1,_), vostok_programme_until_house_during_11_17_overlap(Start1,End1), Start is max((Start1-17),W1), End is (End1-11), Start=<End.

vostok_programme_until_house_during_11_17_at_1955(Res) :- setof((Start,End),vostok_programme_until_house_during_11_17(Start,End),AllINtervals), checkvalidity(1955,AllINtervals,Res).

check_query() :- write('Query = vostok_programme_until_house_during_11_17_at_1955'), (vostok_programme_until_house_during_11_17_at_1955(true) -> write('\nRes   = true');write('\nRes   = false')).

