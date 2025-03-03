:- include('database.pl').
romantic_music(Start,End) :- begin('romantic_music',_,_,Start), end('romantic_music',_,_,End), Start=<End.

war_of_1812(Start,End) :- begin('war_of_1812',_,_,Start), end('war_of_1812',_,_,End), Start=<End.

romantic_music_last_till_9_19(Start,End) :- romantic_music(Start1,End1), (End1-Start1)>=9, Start is (Start1+9), End is (End1+1).

romantic_music_until_war_of_1812_during_9_19_overlap(Start,End) :- romantic_music_last_till_9_19(Start1,End1), war_of_1812(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

romantic_music_until_war_of_1812_during_9_19(Start,End) :- romantic_music(W1,_), romantic_music_until_war_of_1812_during_9_19_overlap(Start1,End1), Start is max((Start1-19),W1), End is (End1-9), Start=<End.

romantic_music_until_war_of_1812_during_9_19_at_1716(Res) :- setof((Start,End),romantic_music_until_war_of_1812_during_9_19(Start,End),AllINtervals), checkvalidity(1716,AllINtervals,Res).

check_query() :- write('Query = romantic_music_until_war_of_1812_during_9_19_at_1716'), (romantic_music_until_war_of_1812_during_9_19_at_1716(true) -> write('\nRes   = true');write('\nRes   = false')).

