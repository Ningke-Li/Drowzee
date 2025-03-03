:- include('database.pl').
ev_2011_12_serie_a(Start,End) :- begin('ev_2011_12_serie_a',_,_,Start), end('ev_2011_12_serie_a',_,_,End), Start=<End.

ev_2014_15_uefa_champions_league(Start,End) :- begin('ev_2014_15_uefa_champions_league',_,_,Start), end('ev_2014_15_uefa_champions_league',_,_,End), Start=<End.

generate_facts_ev_2011_12_serie_a_OR_ev_2014_15_uefa_champions_league([]) :- assert(ev_2011_12_serie_a_OR_ev_2014_15_uefa_champions_league(-1,-1)).

generate_facts_ev_2011_12_serie_a_OR_ev_2014_15_uefa_champions_league([(Start,End) | Tail]) :- assert(ev_2011_12_serie_a_OR_ev_2014_15_uefa_champions_league(Start,End)), generate_facts_ev_2011_12_serie_a_OR_ev_2014_15_uefa_champions_league(Tail).

ev_2011_12_serie_a_OR_ev_2014_15_uefa_champions_league_aux() :- findall((Start,End),ev_2011_12_serie_a(Start,End),Interval1), findall((Start,End),ev_2014_15_uefa_champions_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2011_12_serie_a_OR_ev_2014_15_uefa_champions_league(Interval).

ev_2011_12_serie_a_OR_ev_2014_15_uefa_champions_league_at_1886(Res) :- setof((Start,End),ev_2011_12_serie_a_OR_ev_2014_15_uefa_champions_league(Start,End),AllINtervals), checkvalidity(1886,AllINtervals,Res).

check_query() :- write('Query = ev_2011_12_serie_a_OR_ev_2014_15_uefa_champions_league_at_1886'), (ev_2011_12_serie_a_OR_ev_2014_15_uefa_champions_league_at_1886(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2011_12_serie_a_OR_ev_2014_15_uefa_champions_league_aux().

