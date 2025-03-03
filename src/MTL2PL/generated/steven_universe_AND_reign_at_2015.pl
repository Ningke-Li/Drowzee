:- include('database.pl').
steven_universe(Start,End) :- begin('steven_universe',_,_,Start), end('steven_universe',_,_,End), Start=<End.

reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

generate_facts_steven_universe_AND_reign([]) :- assert(steven_universe_AND_reign(-1,-1)).

generate_facts_steven_universe_AND_reign([(Start,End) | Tail]) :- assert(steven_universe_AND_reign(Start,End)), generate_facts_steven_universe_AND_reign(Tail).

steven_universe_AND_reign_aux() :- findall((Start,End),steven_universe(Start,End),Interval1), findall((Start,End),reign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_steven_universe_AND_reign(Interval).

steven_universe_AND_reign_at_2015(Res) :- setof((Start,End),steven_universe_AND_reign(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = steven_universe_AND_reign_at_2015'), (steven_universe_AND_reign_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- steven_universe_AND_reign_aux().

