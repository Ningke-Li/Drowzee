:- include('database.pl').
belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

bojack_horseman(Start,End) :- begin('bojack_horseman',_,_,Start), end('bojack_horseman',_,_,End), Start=<End.

generate_facts_belgian_franc_OR_bojack_horseman([]) :- assert(belgian_franc_OR_bojack_horseman(-1,-1)).

generate_facts_belgian_franc_OR_bojack_horseman([(Start,End) | Tail]) :- assert(belgian_franc_OR_bojack_horseman(Start,End)), generate_facts_belgian_franc_OR_bojack_horseman(Tail).

belgian_franc_OR_bojack_horseman_aux() :- findall((Start,End),belgian_franc(Start,End),Interval1), findall((Start,End),bojack_horseman(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_belgian_franc_OR_bojack_horseman(Interval).

belgian_franc_OR_bojack_horseman_at_2016(Res) :- setof((Start,End),belgian_franc_OR_bojack_horseman(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = belgian_franc_OR_bojack_horseman_at_2016'), (belgian_franc_OR_bojack_horseman_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- belgian_franc_OR_bojack_horseman_aux().

