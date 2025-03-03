:- include('database.pl').
winx_club(Start,End) :- begin('winx_club',_,_,Start), end('winx_club',_,_,End), Start=<End.

quantico(Start,End) :- begin('quantico',_,_,Start), end('quantico',_,_,End), Start=<End.

generate_facts_winx_club_AND_quantico([]) :- assert(winx_club_AND_quantico(-1,-1)).

generate_facts_winx_club_AND_quantico([(Start,End) | Tail]) :- assert(winx_club_AND_quantico(Start,End)), generate_facts_winx_club_AND_quantico(Tail).

winx_club_AND_quantico_aux() :- findall((Start,End),winx_club(Start,End),Interval1), findall((Start,End),quantico(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_winx_club_AND_quantico(Interval).

winx_club_AND_quantico_at_1883(Res) :- setof((Start,End),winx_club_AND_quantico(Start,End),AllINtervals), checkvalidity(1883,AllINtervals,Res).

check_query() :- write('Query = winx_club_AND_quantico_at_1883'), (winx_club_AND_quantico_at_1883(true) -> write('\nRes   = true');write('\nRes   = false')).
?- winx_club_AND_quantico_aux().

