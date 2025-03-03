:- include('database.pl').
first_wave_feminism(Start,End) :- begin('first_wave_feminism',_,_,Start), end('first_wave_feminism',_,_,End), Start=<End.

european_theater_of_world_war_ii(Start,End) :- begin('european_theater_of_world_war_ii',_,_,Start), end('european_theater_of_world_war_ii',_,_,End), Start=<End.

first_wave_feminism_last_till_24_34(Start,End) :- first_wave_feminism(Start1,End1), (End1-Start1)>=24, Start is (Start1+24), End is (End1+1).

first_wave_feminism_until_european_theater_of_world_war_ii_during_24_34_overlap(Start,End) :- first_wave_feminism_last_till_24_34(Start1,End1), european_theater_of_world_war_ii(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

first_wave_feminism_until_european_theater_of_world_war_ii_during_24_34(Start,End) :- first_wave_feminism(W1,_), first_wave_feminism_until_european_theater_of_world_war_ii_during_24_34_overlap(Start1,End1), Start is max((Start1-34),W1), End is (End1-24), Start=<End.

first_wave_feminism_until_european_theater_of_world_war_ii_during_24_34_at_1882(Res) :- setof((Start,End),first_wave_feminism_until_european_theater_of_world_war_ii_during_24_34(Start,End),AllINtervals), checkvalidity(1882,AllINtervals,Res).

check_query() :- write('Query = first_wave_feminism_until_european_theater_of_world_war_ii_during_24_34_at_1882'), (first_wave_feminism_until_european_theater_of_world_war_ii_during_24_34_at_1882(true) -> write('\nRes   = true');write('\nRes   = false')).

