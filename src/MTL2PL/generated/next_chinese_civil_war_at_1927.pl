:- include('database.pl').
chinese_civil_war(Start,End) :- begin('chinese_civil_war',_,_,Start), end('chinese_civil_war',_,_,End), Start=<End.

next_chinese_civil_war(Start,End) :- chinese_civil_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_chinese_civil_war_at_1927(Res) :- setof((Start,End),next_chinese_civil_war(Start,End),AllINtervals), checkvalidity(1927,AllINtervals,Res).

check_query() :- write('Query = next_chinese_civil_war_at_1927'), (next_chinese_civil_war_at_1927(true) -> write('\nRes   = true');write('\nRes   = false')).

