:- include('database.pl').
mexican_war_of_independence(Start,End) :- begin('mexican_war_of_independence',_,_,Start), end('mexican_war_of_independence',_,_,End), Start=<End.

war_of_1812(Start,End) :- begin('war_of_1812',_,_,Start), end('war_of_1812',_,_,End), Start=<End.

mexican_war_of_independence_last_till_1_9(Start,End) :- mexican_war_of_independence(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

mexican_war_of_independence_until_war_of_1812_during_1_9_overlap(Start,End) :- mexican_war_of_independence_last_till_1_9(Start1,End1), war_of_1812(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mexican_war_of_independence_until_war_of_1812_during_1_9(Start,End) :- mexican_war_of_independence(W1,_), mexican_war_of_independence_until_war_of_1812_during_1_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-1), Start=<End.

mexican_war_of_independence_until_war_of_1812_during_1_9_at_1803(Res) :- setof((Start,End),mexican_war_of_independence_until_war_of_1812_during_1_9(Start,End),AllINtervals), checkvalidity(1803,AllINtervals,Res).

check_query() :- write('Query = mexican_war_of_independence_until_war_of_1812_during_1_9_at_1803'), (mexican_war_of_independence_until_war_of_1812_during_1_9_at_1803(true) -> write('\nRes   = true');write('\nRes   = false')).

