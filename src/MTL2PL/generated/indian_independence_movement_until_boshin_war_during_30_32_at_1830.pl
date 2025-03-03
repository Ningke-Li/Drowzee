:- include('database.pl').
indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

boshin_war(Start,End) :- begin('boshin_war',_,_,Start), end('boshin_war',_,_,End), Start=<End.

indian_independence_movement_last_till_30_32(Start,End) :- indian_independence_movement(Start1,End1), (End1-Start1)>=30, Start is (Start1+30), End is (End1+1).

indian_independence_movement_until_boshin_war_during_30_32_overlap(Start,End) :- indian_independence_movement_last_till_30_32(Start1,End1), boshin_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

indian_independence_movement_until_boshin_war_during_30_32(Start,End) :- indian_independence_movement(W1,_), indian_independence_movement_until_boshin_war_during_30_32_overlap(Start1,End1), Start is max((Start1-32),W1), End is (End1-30), Start=<End.

indian_independence_movement_until_boshin_war_during_30_32_at_1830(Res) :- setof((Start,End),indian_independence_movement_until_boshin_war_during_30_32(Start,End),AllINtervals), checkvalidity(1830,AllINtervals,Res).

check_query() :- write('Query = indian_independence_movement_until_boshin_war_during_30_32_at_1830'), (indian_independence_movement_until_boshin_war_during_30_32_at_1830(true) -> write('\nRes   = true');write('\nRes   = false')).

