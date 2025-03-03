:- include('database.pl').
eurovision_song_contest_2005(Start,End) :- begin('eurovision_song_contest_2005',_,_,Start), end('eurovision_song_contest_2005',_,_,End), Start=<End.

post_impressionism(Start,End) :- begin('post_impressionism',_,_,Start), end('post_impressionism',_,_,End), Start=<End.

generate_facts_eurovision_song_contest_2005_OR_post_impressionism([]) :- assert(eurovision_song_contest_2005_OR_post_impressionism(-1,-1)).

generate_facts_eurovision_song_contest_2005_OR_post_impressionism([(Start,End) | Tail]) :- assert(eurovision_song_contest_2005_OR_post_impressionism(Start,End)), generate_facts_eurovision_song_contest_2005_OR_post_impressionism(Tail).

eurovision_song_contest_2005_OR_post_impressionism_aux() :- findall((Start,End),eurovision_song_contest_2005(Start,End),Interval1), findall((Start,End),post_impressionism(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_eurovision_song_contest_2005_OR_post_impressionism(Interval).

eurovision_song_contest_2005_OR_post_impressionism_at_1897(Res) :- setof((Start,End),eurovision_song_contest_2005_OR_post_impressionism(Start,End),AllINtervals), checkvalidity(1897,AllINtervals,Res).

check_query() :- write('Query = eurovision_song_contest_2005_OR_post_impressionism_at_1897'), (eurovision_song_contest_2005_OR_post_impressionism_at_1897(true) -> write('\nRes   = true');write('\nRes   = false')).
?- eurovision_song_contest_2005_OR_post_impressionism_aux().

