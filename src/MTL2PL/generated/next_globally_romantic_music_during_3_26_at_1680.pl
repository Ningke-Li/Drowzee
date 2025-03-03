:- include('database.pl').
romantic_music(Start,End) :- begin('romantic_music',_,_,Start), end('romantic_music',_,_,End), Start=<End.

globally_romantic_music_during_3_26(Start,End) :- romantic_music(Start1,End1), Start is (Start1-3), End is (End1-26), Start=<End.

next_globally_romantic_music_during_3_26(Start,End) :- globally_romantic_music_during_3_26(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_romantic_music_during_3_26_at_1680(Res) :- setof((Start,End),next_globally_romantic_music_during_3_26(Start,End),AllINtervals), checkvalidity(1680,AllINtervals,Res).

check_query() :- write('Query = next_globally_romantic_music_during_3_26_at_1680'), (next_globally_romantic_music_during_3_26_at_1680(true) -> write('\nRes   = true');write('\nRes   = false')).

