:- include('database.pl').
world_war_ii(Start,End) :- begin('world_war_ii',_,_,Start), end('world_war_ii',_,_,End), Start=<End.

finally_world_war_ii_during_4_12(Start,End) :- world_war_ii(Start1,End1), (Start1-12)=<(End1-4), Start is (Start1-12), End is (End1-4), Start=<End.

finally_world_war_ii_during_4_12_at_1871(Res) :- setof((Start,End),finally_world_war_ii_during_4_12(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = finally_world_war_ii_during_4_12_at_1871'), (finally_world_war_ii_during_4_12_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).

