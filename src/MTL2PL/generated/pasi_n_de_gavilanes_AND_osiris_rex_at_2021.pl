:- include('database.pl').
pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

osiris_rex(Start,End) :- begin('osiris_rex',_,_,Start), end('osiris_rex',_,_,End), Start=<End.

generate_facts_pasi_n_de_gavilanes_AND_osiris_rex([]) :- assert(pasi_n_de_gavilanes_AND_osiris_rex(-1,-1)).

generate_facts_pasi_n_de_gavilanes_AND_osiris_rex([(Start,End) | Tail]) :- assert(pasi_n_de_gavilanes_AND_osiris_rex(Start,End)), generate_facts_pasi_n_de_gavilanes_AND_osiris_rex(Tail).

pasi_n_de_gavilanes_AND_osiris_rex_aux() :- findall((Start,End),pasi_n_de_gavilanes(Start,End),Interval1), findall((Start,End),osiris_rex(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_pasi_n_de_gavilanes_AND_osiris_rex(Interval).

pasi_n_de_gavilanes_AND_osiris_rex_at_2021(Res) :- setof((Start,End),pasi_n_de_gavilanes_AND_osiris_rex(Start,End),AllINtervals), checkvalidity(2021,AllINtervals,Res).

check_query() :- write('Query = pasi_n_de_gavilanes_AND_osiris_rex_at_2021'), (pasi_n_de_gavilanes_AND_osiris_rex_at_2021(true) -> write('\nRes   = true');write('\nRes   = false')).
?- pasi_n_de_gavilanes_AND_osiris_rex_aux().

