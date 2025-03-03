:- include('database.pl').
the_good_place(Start,End) :- begin('the_good_place',_,_,Start), end('the_good_place',_,_,End), Start=<End.

eurovision_song_contest_2013(Start,End) :- begin('eurovision_song_contest_2013',_,_,Start), end('eurovision_song_contest_2013',_,_,End), Start=<End.

generate_facts_the_good_place_OR_eurovision_song_contest_2013([]) :- assert(the_good_place_OR_eurovision_song_contest_2013(-1,-1)).

generate_facts_the_good_place_OR_eurovision_song_contest_2013([(Start,End) | Tail]) :- assert(the_good_place_OR_eurovision_song_contest_2013(Start,End)), generate_facts_the_good_place_OR_eurovision_song_contest_2013(Tail).

the_good_place_OR_eurovision_song_contest_2013_aux() :- findall((Start,End),the_good_place(Start,End),Interval1), findall((Start,End),eurovision_song_contest_2013(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_good_place_OR_eurovision_song_contest_2013(Interval).

the_good_place_OR_eurovision_song_contest_2013_at_2019(Res) :- setof((Start,End),the_good_place_OR_eurovision_song_contest_2013(Start,End),AllINtervals), checkvalidity(2019,AllINtervals,Res).

check_query() :- write('Query = the_good_place_OR_eurovision_song_contest_2013_at_2019'), (the_good_place_OR_eurovision_song_contest_2013_at_2019(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_good_place_OR_eurovision_song_contest_2013_aux().

