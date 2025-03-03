:- include('database.pl').
second_sino_japanese_war(Start,End) :- begin('second_sino_japanese_war',_,_,Start), end('second_sino_japanese_war',_,_,End), Start=<End.

finally_second_sino_japanese_war_during_9_14(Start,End) :- second_sino_japanese_war(Start1,End1), (Start1-14)=<(End1-9), Start is (Start1-14), End is (End1-9), Start=<End.

next_finally_second_sino_japanese_war_during_9_14(Start,End) :- finally_second_sino_japanese_war_during_9_14(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_second_sino_japanese_war_during_9_14_at_1871(Res) :- setof((Start,End),next_finally_second_sino_japanese_war_during_9_14(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = next_finally_second_sino_japanese_war_during_9_14_at_1871'), (next_finally_second_sino_japanese_war_during_9_14_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).

