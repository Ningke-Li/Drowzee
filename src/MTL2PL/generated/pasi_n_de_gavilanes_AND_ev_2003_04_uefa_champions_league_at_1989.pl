:- include('database.pl').
pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

ev_2003_04_uefa_champions_league(Start,End) :- begin('ev_2003_04_uefa_champions_league',_,_,Start), end('ev_2003_04_uefa_champions_league',_,_,End), Start=<End.

generate_facts_pasi_n_de_gavilanes_AND_ev_2003_04_uefa_champions_league([]) :- assert(pasi_n_de_gavilanes_AND_ev_2003_04_uefa_champions_league(-1,-1)).

generate_facts_pasi_n_de_gavilanes_AND_ev_2003_04_uefa_champions_league([(Start,End) | Tail]) :- assert(pasi_n_de_gavilanes_AND_ev_2003_04_uefa_champions_league(Start,End)), generate_facts_pasi_n_de_gavilanes_AND_ev_2003_04_uefa_champions_league(Tail).

pasi_n_de_gavilanes_AND_ev_2003_04_uefa_champions_league_aux() :- findall((Start,End),pasi_n_de_gavilanes(Start,End),Interval1), findall((Start,End),ev_2003_04_uefa_champions_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_pasi_n_de_gavilanes_AND_ev_2003_04_uefa_champions_league(Interval).

pasi_n_de_gavilanes_AND_ev_2003_04_uefa_champions_league_at_1989(Res) :- setof((Start,End),pasi_n_de_gavilanes_AND_ev_2003_04_uefa_champions_league(Start,End),AllINtervals), checkvalidity(1989,AllINtervals,Res).

check_query() :- write('Query = pasi_n_de_gavilanes_AND_ev_2003_04_uefa_champions_league_at_1989'), (pasi_n_de_gavilanes_AND_ev_2003_04_uefa_champions_league_at_1989(true) -> write('\nRes   = true');write('\nRes   = false')).
?- pasi_n_de_gavilanes_AND_ev_2003_04_uefa_champions_league_aux().

