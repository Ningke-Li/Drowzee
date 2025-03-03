:- include('database.pl').
breaking_bad(Start,End) :- begin('breaking_bad',_,_,Start), end('breaking_bad',_,_,End), Start=<End.

psych(Start,End) :- begin('psych',_,_,Start), end('psych',_,_,End), Start=<End.

generate_facts_breaking_bad_AND_psych([]) :- assert(breaking_bad_AND_psych(-1,-1)).

generate_facts_breaking_bad_AND_psych([(Start,End) | Tail]) :- assert(breaking_bad_AND_psych(Start,End)), generate_facts_breaking_bad_AND_psych(Tail).

breaking_bad_AND_psych_aux() :- findall((Start,End),breaking_bad(Start,End),Interval1), findall((Start,End),psych(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_breaking_bad_AND_psych(Interval).

breaking_bad_AND_psych_at_2011(Res) :- setof((Start,End),breaking_bad_AND_psych(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = breaking_bad_AND_psych_at_2011'), (breaking_bad_AND_psych_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- breaking_bad_AND_psych_aux().

