:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

finally_war_in_afghanistan_during_1_18(Start,End) :- war_in_afghanistan(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

finally_war_in_afghanistan_during_1_18_at_1997(Res) :- setof((Start,End),finally_war_in_afghanistan_during_1_18(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = finally_war_in_afghanistan_during_1_18_at_1997'), (finally_war_in_afghanistan_during_1_18_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

