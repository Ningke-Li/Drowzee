:- include('database.pl').
ev_2012_13_uefa_champions_league(Start,End) :- begin('ev_2012_13_uefa_champions_league',_,_,Start), end('ev_2012_13_uefa_champions_league',_,_,End), Start=<End.

the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

generate_facts_ev_2012_13_uefa_champions_league_OR_the_thundermans([]) :- assert(ev_2012_13_uefa_champions_league_OR_the_thundermans(-1,-1)).

generate_facts_ev_2012_13_uefa_champions_league_OR_the_thundermans([(Start,End) | Tail]) :- assert(ev_2012_13_uefa_champions_league_OR_the_thundermans(Start,End)), generate_facts_ev_2012_13_uefa_champions_league_OR_the_thundermans(Tail).

ev_2012_13_uefa_champions_league_OR_the_thundermans_aux() :- findall((Start,End),ev_2012_13_uefa_champions_league(Start,End),Interval1), findall((Start,End),the_thundermans(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2012_13_uefa_champions_league_OR_the_thundermans(Interval).

ev_2012_13_uefa_champions_league_OR_the_thundermans_at_1988(Res) :- setof((Start,End),ev_2012_13_uefa_champions_league_OR_the_thundermans(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = ev_2012_13_uefa_champions_league_OR_the_thundermans_at_1988'), (ev_2012_13_uefa_champions_league_OR_the_thundermans_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_13_uefa_champions_league_OR_the_thundermans_aux().

