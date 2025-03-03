:- include('database.pl').
first_wave_feminism(Start,End) :- begin('first_wave_feminism',_,_,Start), end('first_wave_feminism',_,_,End), Start=<End.

world_war_ii(Start,End) :- begin('world_war_ii',_,_,Start), end('world_war_ii',_,_,End), Start=<End.

first_wave_feminism_last_till_50_52(Start,End) :- first_wave_feminism(Start1,End1), (End1-Start1)>=50, Start is (Start1+50), End is (End1+1).

first_wave_feminism_until_world_war_ii_during_50_52_overlap(Start,End) :- first_wave_feminism_last_till_50_52(Start1,End1), world_war_ii(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

first_wave_feminism_until_world_war_ii_during_50_52(Start,End) :- first_wave_feminism(W1,_), first_wave_feminism_until_world_war_ii_during_50_52_overlap(Start1,End1), Start is max((Start1-52),W1), End is (End1-50), Start=<End.

first_wave_feminism_until_world_war_ii_during_50_52_at_1743(Res) :- setof((Start,End),first_wave_feminism_until_world_war_ii_during_50_52(Start,End),AllINtervals), checkvalidity(1743,AllINtervals,Res).

check_query() :- write('Query = first_wave_feminism_until_world_war_ii_during_50_52_at_1743'), (first_wave_feminism_until_world_war_ii_during_50_52_at_1743(true) -> write('\nRes   = true');write('\nRes   = false')).

