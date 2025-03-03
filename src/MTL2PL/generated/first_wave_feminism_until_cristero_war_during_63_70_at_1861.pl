:- include('database.pl').
first_wave_feminism(Start,End) :- begin('first_wave_feminism',_,_,Start), end('first_wave_feminism',_,_,End), Start=<End.

cristero_war(Start,End) :- begin('cristero_war',_,_,Start), end('cristero_war',_,_,End), Start=<End.

first_wave_feminism_last_till_63_70(Start,End) :- first_wave_feminism(Start1,End1), (End1-Start1)>=63, Start is (Start1+63), End is (End1+1).

first_wave_feminism_until_cristero_war_during_63_70_overlap(Start,End) :- first_wave_feminism_last_till_63_70(Start1,End1), cristero_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

first_wave_feminism_until_cristero_war_during_63_70(Start,End) :- first_wave_feminism(W1,_), first_wave_feminism_until_cristero_war_during_63_70_overlap(Start1,End1), Start is max((Start1-70),W1), End is (End1-63), Start=<End.

first_wave_feminism_until_cristero_war_during_63_70_at_1861(Res) :- setof((Start,End),first_wave_feminism_until_cristero_war_during_63_70(Start,End),AllINtervals), checkvalidity(1861,AllINtervals,Res).

check_query() :- write('Query = first_wave_feminism_until_cristero_war_during_63_70_at_1861'), (first_wave_feminism_until_cristero_war_during_63_70_at_1861(true) -> write('\nRes   = true');write('\nRes   = false')).

