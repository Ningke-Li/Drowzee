:- include('database.pl').
breaking_bad(Start,End) :- begin('breaking_bad',_,_,Start), end('breaking_bad',_,_,End), Start=<End.

victorious(Start,End) :- begin('victorious',_,_,Start), end('victorious',_,_,End), Start=<End.

generate_facts_breaking_bad_AND_victorious([]) :- assert(breaking_bad_AND_victorious(-1,-1)).

generate_facts_breaking_bad_AND_victorious([(Start,End) | Tail]) :- assert(breaking_bad_AND_victorious(Start,End)), generate_facts_breaking_bad_AND_victorious(Tail).

breaking_bad_AND_victorious_aux() :- findall((Start,End),breaking_bad(Start,End),Interval1), findall((Start,End),victorious(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_breaking_bad_AND_victorious(Interval).

breaking_bad_AND_victorious_at_2012(Res) :- setof((Start,End),breaking_bad_AND_victorious(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = breaking_bad_AND_victorious_at_2012'), (breaking_bad_AND_victorious_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- breaking_bad_AND_victorious_aux().

