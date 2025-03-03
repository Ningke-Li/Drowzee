:- include('database.pl').
nordisk_familjebok(Start,End) :- begin('nordisk_familjebok',_,_,Start), end('nordisk_familjebok',_,_,End), Start=<End.

italian_front(Start,End) :- begin('italian_front',_,_,Start), end('italian_front',_,_,End), Start=<End.

nordisk_familjebok_last_till_14_16(Start,End) :- nordisk_familjebok(Start1,End1), (End1-Start1)>=14, Start is (Start1+14), End is (End1+1).

nordisk_familjebok_until_italian_front_during_14_16_overlap(Start,End) :- nordisk_familjebok_last_till_14_16(Start1,End1), italian_front(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

nordisk_familjebok_until_italian_front_during_14_16(Start,End) :- nordisk_familjebok(W1,_), nordisk_familjebok_until_italian_front_during_14_16_overlap(Start1,End1), Start is max((Start1-16),W1), End is (End1-14), Start=<End.

nordisk_familjebok_until_italian_front_during_14_16_at_1903(Res) :- setof((Start,End),nordisk_familjebok_until_italian_front_during_14_16(Start,End),AllINtervals), checkvalidity(1903,AllINtervals,Res).

check_query() :- write('Query = nordisk_familjebok_until_italian_front_during_14_16_at_1903'), (nordisk_familjebok_until_italian_front_during_14_16_at_1903(true) -> write('\nRes   = true');write('\nRes   = false')).

