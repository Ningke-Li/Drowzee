:- include('database.pl').
ev_2017_world_championships_in_athletics(Start,End) :- begin('ev_2017_world_championships_in_athletics',_,_,Start), end('ev_2017_world_championships_in_athletics',_,_,End), Start=<End.

maria_theresa_of_austria(Start,End) :- begin('maria_theresa_of_austria',_,_,Start), end('maria_theresa_of_austria',_,_,End), Start=<End.

generate_facts_ev_2017_world_championships_in_athletics_OR_maria_theresa_of_austria([]) :- assert(ev_2017_world_championships_in_athletics_OR_maria_theresa_of_austria(-1,-1)).

generate_facts_ev_2017_world_championships_in_athletics_OR_maria_theresa_of_austria([(Start,End) | Tail]) :- assert(ev_2017_world_championships_in_athletics_OR_maria_theresa_of_austria(Start,End)), generate_facts_ev_2017_world_championships_in_athletics_OR_maria_theresa_of_austria(Tail).

ev_2017_world_championships_in_athletics_OR_maria_theresa_of_austria_aux() :- findall((Start,End),ev_2017_world_championships_in_athletics(Start,End),Interval1), findall((Start,End),maria_theresa_of_austria(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2017_world_championships_in_athletics_OR_maria_theresa_of_austria(Interval).

ev_2017_world_championships_in_athletics_OR_maria_theresa_of_austria_at_2026(Res) :- setof((Start,End),ev_2017_world_championships_in_athletics_OR_maria_theresa_of_austria(Start,End),AllINtervals), checkvalidity(2026,AllINtervals,Res).

check_query() :- write('Query = ev_2017_world_championships_in_athletics_OR_maria_theresa_of_austria_at_2026'), (ev_2017_world_championships_in_athletics_OR_maria_theresa_of_austria_at_2026(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2017_world_championships_in_athletics_OR_maria_theresa_of_austria_aux().

