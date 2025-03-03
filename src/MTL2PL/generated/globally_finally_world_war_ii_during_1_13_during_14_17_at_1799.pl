:- include('database.pl').
world_war_ii(Start,End) :- begin('world_war_ii',_,_,Start), end('world_war_ii',_,_,End), Start=<End.

finally_world_war_ii_during_1_13(Start,End) :- world_war_ii(Start1,End1), (Start1-13)=<(End1-1), Start is (Start1-13), End is (End1-1), Start=<End.

globally_finally_world_war_ii_during_1_13_during_14_17(Start,End) :- finally_world_war_ii_during_1_13(Start1,End1), Start is (Start1-14), End is (End1-17), Start=<End.

globally_finally_world_war_ii_during_1_13_during_14_17_at_1799(Res) :- setof((Start,End),globally_finally_world_war_ii_during_1_13_during_14_17(Start,End),AllINtervals), checkvalidity(1799,AllINtervals,Res).

check_query() :- write('Query = globally_finally_world_war_ii_during_1_13_during_14_17_at_1799'), (globally_finally_world_war_ii_during_1_13_during_14_17_at_1799(true) -> write('\nRes   = true');write('\nRes   = false')).

