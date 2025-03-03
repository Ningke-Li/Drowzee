:- include('database.pl').
qing_dynasty(Start,End) :- begin('qing_dynasty',_,_,Start), end('qing_dynasty',_,_,End), Start=<End.

glorious_revolution(Start,End) :- begin('glorious_revolution',_,_,Start), end('glorious_revolution',_,_,End), Start=<End.

qing_dynasty_last_till_3_7(Start,End) :- qing_dynasty(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

qing_dynasty_until_glorious_revolution_during_3_7_overlap(Start,End) :- qing_dynasty_last_till_3_7(Start1,End1), glorious_revolution(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

qing_dynasty_until_glorious_revolution_during_3_7(Start,End) :- qing_dynasty(W1,_), qing_dynasty_until_glorious_revolution_during_3_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-3), Start=<End.

qing_dynasty_until_glorious_revolution_during_3_7_at_1681(Res) :- setof((Start,End),qing_dynasty_until_glorious_revolution_during_3_7(Start,End),AllINtervals), checkvalidity(1681,AllINtervals,Res).

check_query() :- write('Query = qing_dynasty_until_glorious_revolution_during_3_7_at_1681'), (qing_dynasty_until_glorious_revolution_during_3_7_at_1681(true) -> write('\nRes   = true');write('\nRes   = false')).

