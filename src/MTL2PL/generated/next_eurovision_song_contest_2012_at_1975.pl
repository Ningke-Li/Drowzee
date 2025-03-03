:- include('database.pl').
eurovision_song_contest_2012(Start,End) :- begin('eurovision_song_contest_2012',_,_,Start), end('eurovision_song_contest_2012',_,_,End), Start=<End.

next_eurovision_song_contest_2012(Start,End) :- eurovision_song_contest_2012(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_eurovision_song_contest_2012_at_1975(Res) :- setof((Start,End),next_eurovision_song_contest_2012(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = next_eurovision_song_contest_2012_at_1975'), (next_eurovision_song_contest_2012_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).

