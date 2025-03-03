:- include('database.pl').
battlestar_galactica(Start,End) :- begin('battlestar_galactica',_,_,Start), end('battlestar_galactica',_,_,End), Start=<End.

brothers___sisters(Start,End) :- begin('brothers___sisters',_,_,Start), end('brothers___sisters',_,_,End), Start=<End.

battlestar_galactica_last_till_2_8(Start,End) :- battlestar_galactica(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

battlestar_galactica_until_brothers___sisters_during_2_8_overlap(Start,End) :- battlestar_galactica_last_till_2_8(Start1,End1), brothers___sisters(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

battlestar_galactica_until_brothers___sisters_during_2_8(Start,End) :- battlestar_galactica(W1,_), battlestar_galactica_until_brothers___sisters_during_2_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-2), Start=<End.

battlestar_galactica_until_brothers___sisters_during_2_8_at_2006(Res) :- setof((Start,End),battlestar_galactica_until_brothers___sisters_during_2_8(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = battlestar_galactica_until_brothers___sisters_during_2_8_at_2006'), (battlestar_galactica_until_brothers___sisters_during_2_8_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

