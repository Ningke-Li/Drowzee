:- include('database.pl').
ev_1928_winter_olympics(Start,End) :- begin('ev_1928_winter_olympics',_,_,Start), end('ev_1928_winter_olympics',_,_,End), Start=<End.

pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

generate_facts_ev_1928_winter_olympics_OR_pasi_n_de_gavilanes([]) :- assert(ev_1928_winter_olympics_OR_pasi_n_de_gavilanes(-1,-1)).

generate_facts_ev_1928_winter_olympics_OR_pasi_n_de_gavilanes([(Start,End) | Tail]) :- assert(ev_1928_winter_olympics_OR_pasi_n_de_gavilanes(Start,End)), generate_facts_ev_1928_winter_olympics_OR_pasi_n_de_gavilanes(Tail).

ev_1928_winter_olympics_OR_pasi_n_de_gavilanes_aux() :- findall((Start,End),ev_1928_winter_olympics(Start,End),Interval1), findall((Start,End),pasi_n_de_gavilanes(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1928_winter_olympics_OR_pasi_n_de_gavilanes(Interval).

ev_1928_winter_olympics_OR_pasi_n_de_gavilanes_at_1807(Res) :- setof((Start,End),ev_1928_winter_olympics_OR_pasi_n_de_gavilanes(Start,End),AllINtervals), checkvalidity(1807,AllINtervals,Res).

check_query() :- write('Query = ev_1928_winter_olympics_OR_pasi_n_de_gavilanes_at_1807'), (ev_1928_winter_olympics_OR_pasi_n_de_gavilanes_at_1807(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1928_winter_olympics_OR_pasi_n_de_gavilanes_aux().

