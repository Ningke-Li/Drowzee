:- include('database.pl').
second_opium_war(Start,End) :- begin('second_opium_war',_,_,Start), end('second_opium_war',_,_,End), Start=<End.

finally_second_opium_war_during_10_11(Start,End) :- second_opium_war(Start1,End1), (Start1-11)=<(End1-10), Start is (Start1-11), End is (End1-10), Start=<End.

finally_second_opium_war_during_10_11_at_1888(Res) :- setof((Start,End),finally_second_opium_war_during_10_11(Start,End),AllINtervals), checkvalidity(1888,AllINtervals,Res).

check_query() :- write('Query = finally_second_opium_war_during_10_11_at_1888'), (finally_second_opium_war_during_10_11_at_1888(true) -> write('\nRes   = true');write('\nRes   = false')).

