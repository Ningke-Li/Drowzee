:- include('database.pl').
peseta(Start,End) :- begin('peseta',_,_,Start), end('peseta',_,_,End), Start=<End.

romanian_war_of_independence(Start,End) :- begin('romanian_war_of_independence',_,_,Start), end('romanian_war_of_independence',_,_,End), Start=<End.

peseta_last_till_7_12(Start,End) :- peseta(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

peseta_until_romanian_war_of_independence_during_7_12_overlap(Start,End) :- peseta_last_till_7_12(Start1,End1), romanian_war_of_independence(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

peseta_until_romanian_war_of_independence_during_7_12(Start,End) :- peseta(W1,_), peseta_until_romanian_war_of_independence_during_7_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-7), Start=<End.

peseta_until_romanian_war_of_independence_during_7_12_at_1869(Res) :- setof((Start,End),peseta_until_romanian_war_of_independence_during_7_12(Start,End),AllINtervals), checkvalidity(1869,AllINtervals,Res).

check_query() :- write('Query = peseta_until_romanian_war_of_independence_during_7_12_at_1869'), (peseta_until_romanian_war_of_independence_during_7_12_at_1869(true) -> write('\nRes   = true');write('\nRes   = false')).

