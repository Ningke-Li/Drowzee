:- include('database.pl').
qing_dynasty(Start,End) :- begin('qing_dynasty',_,_,Start), end('qing_dynasty',_,_,End), Start=<End.

second_french_empire(Start,End) :- begin('second_french_empire',_,_,Start), end('second_french_empire',_,_,End), Start=<End.

qing_dynasty_last_till_196_198(Start,End) :- qing_dynasty(Start1,End1), (End1-Start1)>=196, Start is (Start1+196), End is (End1+1).

qing_dynasty_until_second_french_empire_during_196_198_overlap(Start,End) :- qing_dynasty_last_till_196_198(Start1,End1), second_french_empire(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

qing_dynasty_until_second_french_empire_during_196_198(Start,End) :- qing_dynasty(W1,_), qing_dynasty_until_second_french_empire_during_196_198_overlap(Start1,End1), Start is max((Start1-198),W1), End is (End1-196), Start=<End.

qing_dynasty_until_second_french_empire_during_196_198_at_1512(Res) :- setof((Start,End),qing_dynasty_until_second_french_empire_during_196_198(Start,End),AllINtervals), checkvalidity(1512,AllINtervals,Res).

check_query() :- write('Query = qing_dynasty_until_second_french_empire_during_196_198_at_1512'), (qing_dynasty_until_second_french_empire_during_196_198_at_1512(true) -> write('\nRes   = true');write('\nRes   = false')).

