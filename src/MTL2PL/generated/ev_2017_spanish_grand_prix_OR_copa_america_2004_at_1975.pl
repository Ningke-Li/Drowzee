:- include('database.pl').
ev_2017_spanish_grand_prix(Start,End) :- begin('ev_2017_spanish_grand_prix',_,_,Start), end('ev_2017_spanish_grand_prix',_,_,End), Start=<End.

copa_america_2004(Start,End) :- begin('copa_america_2004',_,_,Start), end('copa_america_2004',_,_,End), Start=<End.

generate_facts_ev_2017_spanish_grand_prix_OR_copa_america_2004([]) :- assert(ev_2017_spanish_grand_prix_OR_copa_america_2004(-1,-1)).

generate_facts_ev_2017_spanish_grand_prix_OR_copa_america_2004([(Start,End) | Tail]) :- assert(ev_2017_spanish_grand_prix_OR_copa_america_2004(Start,End)), generate_facts_ev_2017_spanish_grand_prix_OR_copa_america_2004(Tail).

ev_2017_spanish_grand_prix_OR_copa_america_2004_aux() :- findall((Start,End),ev_2017_spanish_grand_prix(Start,End),Interval1), findall((Start,End),copa_america_2004(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2017_spanish_grand_prix_OR_copa_america_2004(Interval).

ev_2017_spanish_grand_prix_OR_copa_america_2004_at_1975(Res) :- setof((Start,End),ev_2017_spanish_grand_prix_OR_copa_america_2004(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = ev_2017_spanish_grand_prix_OR_copa_america_2004_at_1975'), (ev_2017_spanish_grand_prix_OR_copa_america_2004_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2017_spanish_grand_prix_OR_copa_america_2004_aux().

