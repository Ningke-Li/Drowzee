:- include('database.pl').
second_opium_war(Start,End) :- begin('second_opium_war',_,_,Start), end('second_opium_war',_,_,End), Start=<End.

finally_second_opium_war_during_4_14(Start,End) :- second_opium_war(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

finally_second_opium_war_during_4_14_at_1805(Res) :- setof((Start,End),finally_second_opium_war_during_4_14(Start,End),AllINtervals), checkvalidity(1805,AllINtervals,Res).

check_query() :- write('Query = finally_second_opium_war_during_4_14_at_1805'), (finally_second_opium_war_during_4_14_at_1805(true) -> write('\nRes   = true');write('\nRes   = false')).

