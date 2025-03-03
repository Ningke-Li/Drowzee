:- include('database.pl').
italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

cold_war(Start,End) :- begin('cold_war',_,_,Start), end('cold_war',_,_,End), Start=<End.

italian_lira_last_till_14_15(Start,End) :- italian_lira(Start1,End1), (End1-Start1)>=14, Start is (Start1+14), End is (End1+1).

italian_lira_until_cold_war_during_14_15_overlap(Start,End) :- italian_lira_last_till_14_15(Start1,End1), cold_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

italian_lira_until_cold_war_during_14_15(Start,End) :- italian_lira(W1,_), italian_lira_until_cold_war_during_14_15_overlap(Start1,End1), Start is max((Start1-15),W1), End is (End1-14), Start=<End.

italian_lira_until_cold_war_during_14_15_at_1802(Res) :- setof((Start,End),italian_lira_until_cold_war_during_14_15(Start,End),AllINtervals), checkvalidity(1802,AllINtervals,Res).

check_query() :- write('Query = italian_lira_until_cold_war_during_14_15_at_1802'), (italian_lira_until_cold_war_during_14_15_at_1802(true) -> write('\nRes   = true');write('\nRes   = false')).

