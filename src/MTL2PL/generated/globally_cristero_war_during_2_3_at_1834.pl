:- include('database.pl').
cristero_war(Start,End) :- begin('cristero_war',_,_,Start), end('cristero_war',_,_,End), Start=<End.

globally_cristero_war_during_2_3(Start,End) :- cristero_war(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

globally_cristero_war_during_2_3_at_1834(Res) :- setof((Start,End),globally_cristero_war_during_2_3(Start,End),AllINtervals), checkvalidity(1834,AllINtervals,Res).

check_query() :- write('Query = globally_cristero_war_during_2_3_at_1834'), (globally_cristero_war_during_2_3_at_1834(true) -> write('\nRes   = true');write('\nRes   = false')).

