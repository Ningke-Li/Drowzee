:- include('database.pl').
pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

gilmore_girls(Start,End) :- begin('gilmore_girls',_,_,Start), end('gilmore_girls',_,_,End), Start=<End.

generate_facts_pasi_n_de_gavilanes_AND_gilmore_girls([]) :- assert(pasi_n_de_gavilanes_AND_gilmore_girls(-1,-1)).

generate_facts_pasi_n_de_gavilanes_AND_gilmore_girls([(Start,End) | Tail]) :- assert(pasi_n_de_gavilanes_AND_gilmore_girls(Start,End)), generate_facts_pasi_n_de_gavilanes_AND_gilmore_girls(Tail).

pasi_n_de_gavilanes_AND_gilmore_girls_aux() :- findall((Start,End),pasi_n_de_gavilanes(Start,End),Interval1), findall((Start,End),gilmore_girls(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_pasi_n_de_gavilanes_AND_gilmore_girls(Interval).

pasi_n_de_gavilanes_AND_gilmore_girls_at_2004(Res) :- setof((Start,End),pasi_n_de_gavilanes_AND_gilmore_girls(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = pasi_n_de_gavilanes_AND_gilmore_girls_at_2004'), (pasi_n_de_gavilanes_AND_gilmore_girls_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- pasi_n_de_gavilanes_AND_gilmore_girls_aux().

