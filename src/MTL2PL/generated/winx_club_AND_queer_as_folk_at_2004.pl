:- include('database.pl').
winx_club(Start,End) :- begin('winx_club',_,_,Start), end('winx_club',_,_,End), Start=<End.

queer_as_folk(Start,End) :- begin('queer_as_folk',_,_,Start), end('queer_as_folk',_,_,End), Start=<End.

generate_facts_winx_club_AND_queer_as_folk([]) :- assert(winx_club_AND_queer_as_folk(-1,-1)).

generate_facts_winx_club_AND_queer_as_folk([(Start,End) | Tail]) :- assert(winx_club_AND_queer_as_folk(Start,End)), generate_facts_winx_club_AND_queer_as_folk(Tail).

winx_club_AND_queer_as_folk_aux() :- findall((Start,End),winx_club(Start,End),Interval1), findall((Start,End),queer_as_folk(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_winx_club_AND_queer_as_folk(Interval).

winx_club_AND_queer_as_folk_at_2004(Res) :- setof((Start,End),winx_club_AND_queer_as_folk(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = winx_club_AND_queer_as_folk_at_2004'), (winx_club_AND_queer_as_folk_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- winx_club_AND_queer_as_folk_aux().

