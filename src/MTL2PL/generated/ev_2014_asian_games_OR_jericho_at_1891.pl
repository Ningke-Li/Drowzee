:- include('database.pl').
ev_2014_asian_games(Start,End) :- begin('ev_2014_asian_games',_,_,Start), end('ev_2014_asian_games',_,_,End), Start=<End.

jericho(Start,End) :- begin('jericho',_,_,Start), end('jericho',_,_,End), Start=<End.

generate_facts_ev_2014_asian_games_OR_jericho([]) :- assert(ev_2014_asian_games_OR_jericho(-1,-1)).

generate_facts_ev_2014_asian_games_OR_jericho([(Start,End) | Tail]) :- assert(ev_2014_asian_games_OR_jericho(Start,End)), generate_facts_ev_2014_asian_games_OR_jericho(Tail).

ev_2014_asian_games_OR_jericho_aux() :- findall((Start,End),ev_2014_asian_games(Start,End),Interval1), findall((Start,End),jericho(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_asian_games_OR_jericho(Interval).

ev_2014_asian_games_OR_jericho_at_1891(Res) :- setof((Start,End),ev_2014_asian_games_OR_jericho(Start,End),AllINtervals), checkvalidity(1891,AllINtervals,Res).

check_query() :- write('Query = ev_2014_asian_games_OR_jericho_at_1891'), (ev_2014_asian_games_OR_jericho_at_1891(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_asian_games_OR_jericho_aux().

