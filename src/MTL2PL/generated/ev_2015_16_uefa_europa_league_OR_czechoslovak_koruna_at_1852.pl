:- include('database.pl').
ev_2015_16_uefa_europa_league(Start,End) :- begin('ev_2015_16_uefa_europa_league',_,_,Start), end('ev_2015_16_uefa_europa_league',_,_,End), Start=<End.

czechoslovak_koruna(Start,End) :- begin('czechoslovak_koruna',_,_,Start), end('czechoslovak_koruna',_,_,End), Start=<End.

generate_facts_ev_2015_16_uefa_europa_league_OR_czechoslovak_koruna([]) :- assert(ev_2015_16_uefa_europa_league_OR_czechoslovak_koruna(-1,-1)).

generate_facts_ev_2015_16_uefa_europa_league_OR_czechoslovak_koruna([(Start,End) | Tail]) :- assert(ev_2015_16_uefa_europa_league_OR_czechoslovak_koruna(Start,End)), generate_facts_ev_2015_16_uefa_europa_league_OR_czechoslovak_koruna(Tail).

ev_2015_16_uefa_europa_league_OR_czechoslovak_koruna_aux() :- findall((Start,End),ev_2015_16_uefa_europa_league(Start,End),Interval1), findall((Start,End),czechoslovak_koruna(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2015_16_uefa_europa_league_OR_czechoslovak_koruna(Interval).

ev_2015_16_uefa_europa_league_OR_czechoslovak_koruna_at_1852(Res) :- setof((Start,End),ev_2015_16_uefa_europa_league_OR_czechoslovak_koruna(Start,End),AllINtervals), checkvalidity(1852,AllINtervals,Res).

check_query() :- write('Query = ev_2015_16_uefa_europa_league_OR_czechoslovak_koruna_at_1852'), (ev_2015_16_uefa_europa_league_OR_czechoslovak_koruna_at_1852(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2015_16_uefa_europa_league_OR_czechoslovak_koruna_aux().

