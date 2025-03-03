:- include('database.pl').
ev_2017_australian_grand_prix(Start,End) :- begin('ev_2017_australian_grand_prix',_,_,Start), end('ev_2017_australian_grand_prix',_,_,End), Start=<End.

august_2014(Start,End) :- begin('august_2014',_,_,Start), end('august_2014',_,_,End), Start=<End.

generate_facts_ev_2017_australian_grand_prix_OR_august_2014([]) :- assert(ev_2017_australian_grand_prix_OR_august_2014(-1,-1)).

generate_facts_ev_2017_australian_grand_prix_OR_august_2014([(Start,End) | Tail]) :- assert(ev_2017_australian_grand_prix_OR_august_2014(Start,End)), generate_facts_ev_2017_australian_grand_prix_OR_august_2014(Tail).

ev_2017_australian_grand_prix_OR_august_2014_aux() :- findall((Start,End),ev_2017_australian_grand_prix(Start,End),Interval1), findall((Start,End),august_2014(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2017_australian_grand_prix_OR_august_2014(Interval).

ev_2017_australian_grand_prix_OR_august_2014_at_1934(Res) :- setof((Start,End),ev_2017_australian_grand_prix_OR_august_2014(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = ev_2017_australian_grand_prix_OR_august_2014_at_1934'), (ev_2017_australian_grand_prix_OR_august_2014_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2017_australian_grand_prix_OR_august_2014_aux().

