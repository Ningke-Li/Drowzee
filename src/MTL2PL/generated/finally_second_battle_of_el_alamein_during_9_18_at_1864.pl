:- include('database.pl').
second_battle_of_el_alamein(Start,End) :- begin('second_battle_of_el_alamein',_,_,Start), end('second_battle_of_el_alamein',_,_,End), Start=<End.

finally_second_battle_of_el_alamein_during_9_18(Start,End) :- second_battle_of_el_alamein(Start1,End1), (Start1-18)=<(End1-9), Start is (Start1-18), End is (End1-9), Start=<End.

finally_second_battle_of_el_alamein_during_9_18_at_1864(Res) :- setof((Start,End),finally_second_battle_of_el_alamein_during_9_18(Start,End),AllINtervals), checkvalidity(1864,AllINtervals,Res).

check_query() :- write('Query = finally_second_battle_of_el_alamein_during_9_18_at_1864'), (finally_second_battle_of_el_alamein_during_9_18_at_1864(true) -> write('\nRes   = true');write('\nRes   = false')).

