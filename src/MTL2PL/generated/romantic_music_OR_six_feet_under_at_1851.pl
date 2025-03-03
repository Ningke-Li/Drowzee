:- include('database.pl').
romantic_music(Start,End) :- begin('romantic_music',_,_,Start), end('romantic_music',_,_,End), Start=<End.

six_feet_under(Start,End) :- begin('six_feet_under',_,_,Start), end('six_feet_under',_,_,End), Start=<End.

generate_facts_romantic_music_OR_six_feet_under([]) :- assert(romantic_music_OR_six_feet_under(-1,-1)).

generate_facts_romantic_music_OR_six_feet_under([(Start,End) | Tail]) :- assert(romantic_music_OR_six_feet_under(Start,End)), generate_facts_romantic_music_OR_six_feet_under(Tail).

romantic_music_OR_six_feet_under_aux() :- findall((Start,End),romantic_music(Start,End),Interval1), findall((Start,End),six_feet_under(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_romantic_music_OR_six_feet_under(Interval).

romantic_music_OR_six_feet_under_at_1851(Res) :- setof((Start,End),romantic_music_OR_six_feet_under(Start,End),AllINtervals), checkvalidity(1851,AllINtervals,Res).

check_query() :- write('Query = romantic_music_OR_six_feet_under_at_1851'), (romantic_music_OR_six_feet_under_at_1851(true) -> write('\nRes   = true');write('\nRes   = false')).
?- romantic_music_OR_six_feet_under_aux().

