:- include('database.pl').
second_sino_japanese_war(Start,End) :- begin('second_sino_japanese_war',_,_,Start), end('second_sino_japanese_war',_,_,End), Start=<End.

finally_second_sino_japanese_war_during_6_15(Start,End) :- second_sino_japanese_war(Start1,End1), (Start1-15)=<(End1-6), Start is (Start1-15), End is (End1-6), Start=<End.

finally_second_sino_japanese_war_during_6_15_at_1924(Res) :- setof((Start,End),finally_second_sino_japanese_war_during_6_15(Start,End),AllINtervals), checkvalidity(1924,AllINtervals,Res).

check_query() :- write('Query = finally_second_sino_japanese_war_during_6_15_at_1924'), (finally_second_sino_japanese_war_during_6_15_at_1924(true) -> write('\nRes   = true');write('\nRes   = false')).

