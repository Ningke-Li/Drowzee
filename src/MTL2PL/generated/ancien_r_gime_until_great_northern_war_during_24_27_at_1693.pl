:- include('database.pl').
ancien_r_gime(Start,End) :- begin('ancien_r_gime',_,_,Start), end('ancien_r_gime',_,_,End), Start=<End.

great_northern_war(Start,End) :- begin('great_northern_war',_,_,Start), end('great_northern_war',_,_,End), Start=<End.

ancien_r_gime_last_till_24_27(Start,End) :- ancien_r_gime(Start1,End1), (End1-Start1)>=24, Start is (Start1+24), End is (End1+1).

ancien_r_gime_until_great_northern_war_during_24_27_overlap(Start,End) :- ancien_r_gime_last_till_24_27(Start1,End1), great_northern_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ancien_r_gime_until_great_northern_war_during_24_27(Start,End) :- ancien_r_gime(W1,_), ancien_r_gime_until_great_northern_war_during_24_27_overlap(Start1,End1), Start is max((Start1-27),W1), End is (End1-24), Start=<End.

ancien_r_gime_until_great_northern_war_during_24_27_at_1693(Res) :- setof((Start,End),ancien_r_gime_until_great_northern_war_during_24_27(Start,End),AllINtervals), checkvalidity(1693,AllINtervals,Res).

check_query() :- write('Query = ancien_r_gime_until_great_northern_war_during_24_27_at_1693'), (ancien_r_gime_until_great_northern_war_during_24_27_at_1693(true) -> write('\nRes   = true');write('\nRes   = false')).

