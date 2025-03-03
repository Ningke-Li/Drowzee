:- include('database.pl').
adventure_time(Start,End) :- begin('adventure_time',_,_,Start), end('adventure_time',_,_,End), Start=<End.

jessie(Start,End) :- begin('jessie',_,_,Start), end('jessie',_,_,End), Start=<End.

generate_facts_adventure_time_AND_jessie([]) :- assert(adventure_time_AND_jessie(-1,-1)).

generate_facts_adventure_time_AND_jessie([(Start,End) | Tail]) :- assert(adventure_time_AND_jessie(Start,End)), generate_facts_adventure_time_AND_jessie(Tail).

adventure_time_AND_jessie_aux() :- findall((Start,End),adventure_time(Start,End),Interval1), findall((Start,End),jessie(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_adventure_time_AND_jessie(Interval).

adventure_time_AND_jessie_at_1909(Res) :- setof((Start,End),adventure_time_AND_jessie(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = adventure_time_AND_jessie_at_1909'), (adventure_time_AND_jessie_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).
?- adventure_time_AND_jessie_aux().

