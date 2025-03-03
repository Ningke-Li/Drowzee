:- include('database.pl').
psych(Start,End) :- begin('psych',_,_,Start), end('psych',_,_,End), Start=<End.

merlin(Start,End) :- begin('merlin',_,_,Start), end('merlin',_,_,End), Start=<End.

generate_facts_psych_AND_merlin([]) :- assert(psych_AND_merlin(-1,-1)).

generate_facts_psych_AND_merlin([(Start,End) | Tail]) :- assert(psych_AND_merlin(Start,End)), generate_facts_psych_AND_merlin(Tail).

psych_AND_merlin_aux() :- findall((Start,End),psych(Start,End),Interval1), findall((Start,End),merlin(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_psych_AND_merlin(Interval).

psych_AND_merlin_at_1982(Res) :- setof((Start,End),psych_AND_merlin(Start,End),AllINtervals), checkvalidity(1982,AllINtervals,Res).

check_query() :- write('Query = psych_AND_merlin_at_1982'), (psych_AND_merlin_at_1982(true) -> write('\nRes   = true');write('\nRes   = false')).
?- psych_AND_merlin_aux().

