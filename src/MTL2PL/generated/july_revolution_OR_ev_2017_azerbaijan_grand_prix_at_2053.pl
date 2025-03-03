:- include('database.pl').
july_revolution(Start,End) :- begin('july_revolution',_,_,Start), end('july_revolution',_,_,End), Start=<End.

ev_2017_azerbaijan_grand_prix(Start,End) :- begin('ev_2017_azerbaijan_grand_prix',_,_,Start), end('ev_2017_azerbaijan_grand_prix',_,_,End), Start=<End.

generate_facts_july_revolution_OR_ev_2017_azerbaijan_grand_prix([]) :- assert(july_revolution_OR_ev_2017_azerbaijan_grand_prix(-1,-1)).

generate_facts_july_revolution_OR_ev_2017_azerbaijan_grand_prix([(Start,End) | Tail]) :- assert(july_revolution_OR_ev_2017_azerbaijan_grand_prix(Start,End)), generate_facts_july_revolution_OR_ev_2017_azerbaijan_grand_prix(Tail).

july_revolution_OR_ev_2017_azerbaijan_grand_prix_aux() :- findall((Start,End),july_revolution(Start,End),Interval1), findall((Start,End),ev_2017_azerbaijan_grand_prix(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_july_revolution_OR_ev_2017_azerbaijan_grand_prix(Interval).

july_revolution_OR_ev_2017_azerbaijan_grand_prix_at_2053(Res) :- setof((Start,End),july_revolution_OR_ev_2017_azerbaijan_grand_prix(Start,End),AllINtervals), checkvalidity(2053,AllINtervals,Res).

check_query() :- write('Query = july_revolution_OR_ev_2017_azerbaijan_grand_prix_at_2053'), (july_revolution_OR_ev_2017_azerbaijan_grand_prix_at_2053(true) -> write('\nRes   = true');write('\nRes   = false')).
?- july_revolution_OR_ev_2017_azerbaijan_grand_prix_aux().

