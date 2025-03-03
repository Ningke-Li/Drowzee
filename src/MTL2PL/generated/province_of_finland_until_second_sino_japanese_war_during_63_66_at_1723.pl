:- include('database.pl').
province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

second_sino_japanese_war(Start,End) :- begin('second_sino_japanese_war',_,_,Start), end('second_sino_japanese_war',_,_,End), Start=<End.

province_of_finland_last_till_63_66(Start,End) :- province_of_finland(Start1,End1), (End1-Start1)>=63, Start is (Start1+63), End is (End1+1).

province_of_finland_until_second_sino_japanese_war_during_63_66_overlap(Start,End) :- province_of_finland_last_till_63_66(Start1,End1), second_sino_japanese_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

province_of_finland_until_second_sino_japanese_war_during_63_66(Start,End) :- province_of_finland(W1,_), province_of_finland_until_second_sino_japanese_war_during_63_66_overlap(Start1,End1), Start is max((Start1-66),W1), End is (End1-63), Start=<End.

province_of_finland_until_second_sino_japanese_war_during_63_66_at_1723(Res) :- setof((Start,End),province_of_finland_until_second_sino_japanese_war_during_63_66(Start,End),AllINtervals), checkvalidity(1723,AllINtervals,Res).

check_query() :- write('Query = province_of_finland_until_second_sino_japanese_war_during_63_66_at_1723'), (province_of_finland_until_second_sino_japanese_war_during_63_66_at_1723(true) -> write('\nRes   = true');write('\nRes   = false')).

