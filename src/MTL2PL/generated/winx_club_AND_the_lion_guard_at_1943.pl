:- include('database.pl').
winx_club(Start,End) :- begin('winx_club',_,_,Start), end('winx_club',_,_,End), Start=<End.

the_lion_guard(Start,End) :- begin('the_lion_guard',_,_,Start), end('the_lion_guard',_,_,End), Start=<End.

generate_facts_winx_club_AND_the_lion_guard([]) :- assert(winx_club_AND_the_lion_guard(-1,-1)).

generate_facts_winx_club_AND_the_lion_guard([(Start,End) | Tail]) :- assert(winx_club_AND_the_lion_guard(Start,End)), generate_facts_winx_club_AND_the_lion_guard(Tail).

winx_club_AND_the_lion_guard_aux() :- findall((Start,End),winx_club(Start,End),Interval1), findall((Start,End),the_lion_guard(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_winx_club_AND_the_lion_guard(Interval).

winx_club_AND_the_lion_guard_at_1943(Res) :- setof((Start,End),winx_club_AND_the_lion_guard(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = winx_club_AND_the_lion_guard_at_1943'), (winx_club_AND_the_lion_guard_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- winx_club_AND_the_lion_guard_aux().

