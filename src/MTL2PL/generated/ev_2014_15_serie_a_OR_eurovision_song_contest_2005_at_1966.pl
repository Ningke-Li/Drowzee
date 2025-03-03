:- include('database.pl').
ev_2014_15_serie_a(Start,End) :- begin('ev_2014_15_serie_a',_,_,Start), end('ev_2014_15_serie_a',_,_,End), Start=<End.

eurovision_song_contest_2005(Start,End) :- begin('eurovision_song_contest_2005',_,_,Start), end('eurovision_song_contest_2005',_,_,End), Start=<End.

generate_facts_ev_2014_15_serie_a_OR_eurovision_song_contest_2005([]) :- assert(ev_2014_15_serie_a_OR_eurovision_song_contest_2005(-1,-1)).

generate_facts_ev_2014_15_serie_a_OR_eurovision_song_contest_2005([(Start,End) | Tail]) :- assert(ev_2014_15_serie_a_OR_eurovision_song_contest_2005(Start,End)), generate_facts_ev_2014_15_serie_a_OR_eurovision_song_contest_2005(Tail).

ev_2014_15_serie_a_OR_eurovision_song_contest_2005_aux() :- findall((Start,End),ev_2014_15_serie_a(Start,End),Interval1), findall((Start,End),eurovision_song_contest_2005(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_15_serie_a_OR_eurovision_song_contest_2005(Interval).

ev_2014_15_serie_a_OR_eurovision_song_contest_2005_at_1966(Res) :- setof((Start,End),ev_2014_15_serie_a_OR_eurovision_song_contest_2005(Start,End),AllINtervals), checkvalidity(1966,AllINtervals,Res).

check_query() :- write('Query = ev_2014_15_serie_a_OR_eurovision_song_contest_2005_at_1966'), (ev_2014_15_serie_a_OR_eurovision_song_contest_2005_at_1966(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_15_serie_a_OR_eurovision_song_contest_2005_aux().

