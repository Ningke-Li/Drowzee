:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

globally_war_in_afghanistan_during_1_20(Start,End) :- war_in_afghanistan(Start1,End1), Start is (Start1-1), End is (End1-20), Start=<End.

finally_globally_war_in_afghanistan_during_1_20_during_10_14(Start,End) :- globally_war_in_afghanistan_during_1_20(Start1,End1), (Start1-14)=<(End1-10), Start is (Start1-14), End is (End1-10), Start=<End.

finally_globally_war_in_afghanistan_during_1_20_during_10_14_at_2034(Res) :- setof((Start,End),finally_globally_war_in_afghanistan_during_1_20_during_10_14(Start,End),AllINtervals), checkvalidity(2034,AllINtervals,Res).

check_query() :- write('Query = finally_globally_war_in_afghanistan_during_1_20_during_10_14_at_2034'), (finally_globally_war_in_afghanistan_during_1_20_during_10_14_at_2034(true) -> write('\nRes   = true');write('\nRes   = false')).

