:- include('database.pl').
franco_thai_war(Start,End) :- begin('franco_thai_war',_,_,Start), end('franco_thai_war',_,_,End), Start=<End.

finally_franco_thai_war_during_8_13(Start,End) :- franco_thai_war(Start1,End1), (Start1-13)=<(End1-8), Start is (Start1-13), End is (End1-8), Start=<End.

finally_franco_thai_war_during_8_13_at_1855(Res) :- setof((Start,End),finally_franco_thai_war_during_8_13(Start,End),AllINtervals), checkvalidity(1855,AllINtervals,Res).

check_query() :- write('Query = finally_franco_thai_war_during_8_13_at_1855'), (finally_franco_thai_war_during_8_13_at_1855(true) -> write('\nRes   = true');write('\nRes   = false')).

