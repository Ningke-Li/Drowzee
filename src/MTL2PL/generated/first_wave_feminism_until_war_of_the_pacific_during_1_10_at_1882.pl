:- include('database.pl').
first_wave_feminism(Start,End) :- begin('first_wave_feminism',_,_,Start), end('first_wave_feminism',_,_,End), Start=<End.

war_of_the_pacific(Start,End) :- begin('war_of_the_pacific',_,_,Start), end('war_of_the_pacific',_,_,End), Start=<End.

first_wave_feminism_last_till_1_10(Start,End) :- first_wave_feminism(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

first_wave_feminism_until_war_of_the_pacific_during_1_10_overlap(Start,End) :- first_wave_feminism_last_till_1_10(Start1,End1), war_of_the_pacific(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

first_wave_feminism_until_war_of_the_pacific_during_1_10(Start,End) :- first_wave_feminism(W1,_), first_wave_feminism_until_war_of_the_pacific_during_1_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-1), Start=<End.

first_wave_feminism_until_war_of_the_pacific_during_1_10_at_1882(Res) :- setof((Start,End),first_wave_feminism_until_war_of_the_pacific_during_1_10(Start,End),AllINtervals), checkvalidity(1882,AllINtervals,Res).

check_query() :- write('Query = first_wave_feminism_until_war_of_the_pacific_during_1_10_at_1882'), (first_wave_feminism_until_war_of_the_pacific_during_1_10_at_1882(true) -> write('\nRes   = true');write('\nRes   = false')).

