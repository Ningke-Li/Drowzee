:- include('database.pl').
ev_2011_12_uefa_europa_league(Start,End) :- begin('ev_2011_12_uefa_europa_league',_,_,Start), end('ev_2011_12_uefa_europa_league',_,_,End), Start=<End.

pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

generate_facts_ev_2011_12_uefa_europa_league_OR_pasi_n_de_gavilanes([]) :- assert(ev_2011_12_uefa_europa_league_OR_pasi_n_de_gavilanes(-1,-1)).

generate_facts_ev_2011_12_uefa_europa_league_OR_pasi_n_de_gavilanes([(Start,End) | Tail]) :- assert(ev_2011_12_uefa_europa_league_OR_pasi_n_de_gavilanes(Start,End)), generate_facts_ev_2011_12_uefa_europa_league_OR_pasi_n_de_gavilanes(Tail).

ev_2011_12_uefa_europa_league_OR_pasi_n_de_gavilanes_aux() :- findall((Start,End),ev_2011_12_uefa_europa_league(Start,End),Interval1), findall((Start,End),pasi_n_de_gavilanes(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2011_12_uefa_europa_league_OR_pasi_n_de_gavilanes(Interval).

ev_2011_12_uefa_europa_league_OR_pasi_n_de_gavilanes_at_1953(Res) :- setof((Start,End),ev_2011_12_uefa_europa_league_OR_pasi_n_de_gavilanes(Start,End),AllINtervals), checkvalidity(1953,AllINtervals,Res).

check_query() :- write('Query = ev_2011_12_uefa_europa_league_OR_pasi_n_de_gavilanes_at_1953'), (ev_2011_12_uefa_europa_league_OR_pasi_n_de_gavilanes_at_1953(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2011_12_uefa_europa_league_OR_pasi_n_de_gavilanes_aux().

