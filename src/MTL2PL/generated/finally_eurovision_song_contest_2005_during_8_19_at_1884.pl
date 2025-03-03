:- include('database.pl').
eurovision_song_contest_2005(Start,End) :- begin('eurovision_song_contest_2005',_,_,Start), end('eurovision_song_contest_2005',_,_,End), Start=<End.

finally_eurovision_song_contest_2005_during_8_19(Start,End) :- eurovision_song_contest_2005(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

finally_eurovision_song_contest_2005_during_8_19_at_1884(Res) :- setof((Start,End),finally_eurovision_song_contest_2005_during_8_19(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = finally_eurovision_song_contest_2005_during_8_19_at_1884'), (finally_eurovision_song_contest_2005_during_8_19_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).

