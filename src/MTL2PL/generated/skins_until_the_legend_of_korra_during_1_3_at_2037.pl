:- include('database.pl').
skins(Start,End) :- begin('skins',_,_,Start), end('skins',_,_,End), Start=<End.

the_legend_of_korra(Start,End) :- begin('the_legend_of_korra',_,_,Start), end('the_legend_of_korra',_,_,End), Start=<End.

skins_last_till_1_3(Start,End) :- skins(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

skins_until_the_legend_of_korra_during_1_3_overlap(Start,End) :- skins_last_till_1_3(Start1,End1), the_legend_of_korra(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

skins_until_the_legend_of_korra_during_1_3(Start,End) :- skins(W1,_), skins_until_the_legend_of_korra_during_1_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-1), Start=<End.

skins_until_the_legend_of_korra_during_1_3_at_2037(Res) :- setof((Start,End),skins_until_the_legend_of_korra_during_1_3(Start,End),AllINtervals), checkvalidity(2037,AllINtervals,Res).

check_query() :- write('Query = skins_until_the_legend_of_korra_during_1_3_at_2037'), (skins_until_the_legend_of_korra_during_1_3_at_2037(true) -> write('\nRes   = true');write('\nRes   = false')).

