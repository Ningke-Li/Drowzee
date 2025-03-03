:- include('database.pl').
psych(Start,End) :- begin('psych',_,_,Start), end('psych',_,_,End), Start=<End.

castle(Start,End) :- begin('castle',_,_,Start), end('castle',_,_,End), Start=<End.

generate_facts_psych_AND_castle([]) :- assert(psych_AND_castle(-1,-1)).

generate_facts_psych_AND_castle([(Start,End) | Tail]) :- assert(psych_AND_castle(Start,End)), generate_facts_psych_AND_castle(Tail).

psych_AND_castle_aux() :- findall((Start,End),psych(Start,End),Interval1), findall((Start,End),castle(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_psych_AND_castle(Interval).

psych_AND_castle_at_2026(Res) :- setof((Start,End),psych_AND_castle(Start,End),AllINtervals), checkvalidity(2026,AllINtervals,Res).

check_query() :- write('Query = psych_AND_castle_at_2026'), (psych_AND_castle_at_2026(true) -> write('\nRes   = true');write('\nRes   = false')).
?- psych_AND_castle_aux().

