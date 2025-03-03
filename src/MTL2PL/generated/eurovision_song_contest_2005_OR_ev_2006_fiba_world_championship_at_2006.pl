:- include('database.pl').
eurovision_song_contest_2005(Start,End) :- begin('eurovision_song_contest_2005',_,_,Start), end('eurovision_song_contest_2005',_,_,End), Start=<End.

ev_2006_fiba_world_championship(Start,End) :- begin('ev_2006_fiba_world_championship',_,_,Start), end('ev_2006_fiba_world_championship',_,_,End), Start=<End.

generate_facts_eurovision_song_contest_2005_OR_ev_2006_fiba_world_championship([]) :- assert(eurovision_song_contest_2005_OR_ev_2006_fiba_world_championship(-1,-1)).

generate_facts_eurovision_song_contest_2005_OR_ev_2006_fiba_world_championship([(Start,End) | Tail]) :- assert(eurovision_song_contest_2005_OR_ev_2006_fiba_world_championship(Start,End)), generate_facts_eurovision_song_contest_2005_OR_ev_2006_fiba_world_championship(Tail).

eurovision_song_contest_2005_OR_ev_2006_fiba_world_championship_aux() :- findall((Start,End),eurovision_song_contest_2005(Start,End),Interval1), findall((Start,End),ev_2006_fiba_world_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_eurovision_song_contest_2005_OR_ev_2006_fiba_world_championship(Interval).

eurovision_song_contest_2005_OR_ev_2006_fiba_world_championship_at_2006(Res) :- setof((Start,End),eurovision_song_contest_2005_OR_ev_2006_fiba_world_championship(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = eurovision_song_contest_2005_OR_ev_2006_fiba_world_championship_at_2006'), (eurovision_song_contest_2005_OR_ev_2006_fiba_world_championship_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).
?- eurovision_song_contest_2005_OR_ev_2006_fiba_world_championship_aux().

