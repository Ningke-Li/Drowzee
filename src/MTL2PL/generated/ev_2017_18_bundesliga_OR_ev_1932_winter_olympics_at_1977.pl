:- include('database.pl').
ev_2017_18_bundesliga(Start,End) :- begin('ev_2017_18_bundesliga',_,_,Start), end('ev_2017_18_bundesliga',_,_,End), Start=<End.

ev_1932_winter_olympics(Start,End) :- begin('ev_1932_winter_olympics',_,_,Start), end('ev_1932_winter_olympics',_,_,End), Start=<End.

generate_facts_ev_2017_18_bundesliga_OR_ev_1932_winter_olympics([]) :- assert(ev_2017_18_bundesliga_OR_ev_1932_winter_olympics(-1,-1)).

generate_facts_ev_2017_18_bundesliga_OR_ev_1932_winter_olympics([(Start,End) | Tail]) :- assert(ev_2017_18_bundesliga_OR_ev_1932_winter_olympics(Start,End)), generate_facts_ev_2017_18_bundesliga_OR_ev_1932_winter_olympics(Tail).

ev_2017_18_bundesliga_OR_ev_1932_winter_olympics_aux() :- findall((Start,End),ev_2017_18_bundesliga(Start,End),Interval1), findall((Start,End),ev_1932_winter_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2017_18_bundesliga_OR_ev_1932_winter_olympics(Interval).

ev_2017_18_bundesliga_OR_ev_1932_winter_olympics_at_1977(Res) :- setof((Start,End),ev_2017_18_bundesliga_OR_ev_1932_winter_olympics(Start,End),AllINtervals), checkvalidity(1977,AllINtervals,Res).

check_query() :- write('Query = ev_2017_18_bundesliga_OR_ev_1932_winter_olympics_at_1977'), (ev_2017_18_bundesliga_OR_ev_1932_winter_olympics_at_1977(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2017_18_bundesliga_OR_ev_1932_winter_olympics_aux().

