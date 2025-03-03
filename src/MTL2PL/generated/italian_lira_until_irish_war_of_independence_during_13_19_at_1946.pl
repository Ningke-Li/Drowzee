:- include('database.pl').
italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

irish_war_of_independence(Start,End) :- begin('irish_war_of_independence',_,_,Start), end('irish_war_of_independence',_,_,End), Start=<End.

italian_lira_last_till_13_19(Start,End) :- italian_lira(Start1,End1), (End1-Start1)>=13, Start is (Start1+13), End is (End1+1).

italian_lira_until_irish_war_of_independence_during_13_19_overlap(Start,End) :- italian_lira_last_till_13_19(Start1,End1), irish_war_of_independence(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

italian_lira_until_irish_war_of_independence_during_13_19(Start,End) :- italian_lira(W1,_), italian_lira_until_irish_war_of_independence_during_13_19_overlap(Start1,End1), Start is max((Start1-19),W1), End is (End1-13), Start=<End.

italian_lira_until_irish_war_of_independence_during_13_19_at_1946(Res) :- setof((Start,End),italian_lira_until_irish_war_of_independence_during_13_19(Start,End),AllINtervals), checkvalidity(1946,AllINtervals,Res).

check_query() :- write('Query = italian_lira_until_irish_war_of_independence_during_13_19_at_1946'), (italian_lira_until_irish_war_of_independence_during_13_19_at_1946(true) -> write('\nRes   = true');write('\nRes   = false')).

