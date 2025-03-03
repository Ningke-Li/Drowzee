:- include('database.pl').
battle_of_li_ge(Start,End) :- begin('battle_of_li_ge',_,_,Start), end('battle_of_li_ge',_,_,End), Start=<End.

finally_battle_of_li_ge_during_6_16(Start,End) :- battle_of_li_ge(Start1,End1), (Start1-16)=<(End1-6), Start is (Start1-16), End is (End1-6), Start=<End.

finally_battle_of_li_ge_during_6_16_at_1948(Res) :- setof((Start,End),finally_battle_of_li_ge_during_6_16(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_li_ge_during_6_16_at_1948'), (finally_battle_of_li_ge_during_6_16_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).

