:- include('database.pl').
dust_bowl(Start,End) :- begin('dust_bowl',_,_,Start), end('dust_bowl',_,_,End), Start=<End.

steven_universe(Start,End) :- begin('steven_universe',_,_,Start), end('steven_universe',_,_,End), Start=<End.

generate_facts_dust_bowl_OR_steven_universe([]) :- assert(dust_bowl_OR_steven_universe(-1,-1)).

generate_facts_dust_bowl_OR_steven_universe([(Start,End) | Tail]) :- assert(dust_bowl_OR_steven_universe(Start,End)), generate_facts_dust_bowl_OR_steven_universe(Tail).

dust_bowl_OR_steven_universe_aux() :- findall((Start,End),dust_bowl(Start,End),Interval1), findall((Start,End),steven_universe(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_dust_bowl_OR_steven_universe(Interval).

dust_bowl_OR_steven_universe_at_2026(Res) :- setof((Start,End),dust_bowl_OR_steven_universe(Start,End),AllINtervals), checkvalidity(2026,AllINtervals,Res).

check_query() :- write('Query = dust_bowl_OR_steven_universe_at_2026'), (dust_bowl_OR_steven_universe_at_2026(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dust_bowl_OR_steven_universe_aux().

