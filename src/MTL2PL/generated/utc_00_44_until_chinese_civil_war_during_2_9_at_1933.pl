:- include('database.pl').
utc_00_44(Start,End) :- begin('utc_00_44',_,_,Start), end('utc_00_44',_,_,End), Start=<End.

chinese_civil_war(Start,End) :- begin('chinese_civil_war',_,_,Start), end('chinese_civil_war',_,_,End), Start=<End.

utc_00_44_last_till_2_9(Start,End) :- utc_00_44(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

utc_00_44_until_chinese_civil_war_during_2_9_overlap(Start,End) :- utc_00_44_last_till_2_9(Start1,End1), chinese_civil_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

utc_00_44_until_chinese_civil_war_during_2_9(Start,End) :- utc_00_44(W1,_), utc_00_44_until_chinese_civil_war_during_2_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-2), Start=<End.

utc_00_44_until_chinese_civil_war_during_2_9_at_1933(Res) :- setof((Start,End),utc_00_44_until_chinese_civil_war_during_2_9(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = utc_00_44_until_chinese_civil_war_during_2_9_at_1933'), (utc_00_44_until_chinese_civil_war_during_2_9_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).

