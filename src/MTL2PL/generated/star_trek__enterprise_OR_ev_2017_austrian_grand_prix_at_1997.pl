:- include('database.pl').
star_trek__enterprise(Start,End) :- begin('star_trek__enterprise',_,_,Start), end('star_trek__enterprise',_,_,End), Start=<End.

ev_2017_austrian_grand_prix(Start,End) :- begin('ev_2017_austrian_grand_prix',_,_,Start), end('ev_2017_austrian_grand_prix',_,_,End), Start=<End.

generate_facts_star_trek__enterprise_OR_ev_2017_austrian_grand_prix([]) :- assert(star_trek__enterprise_OR_ev_2017_austrian_grand_prix(-1,-1)).

generate_facts_star_trek__enterprise_OR_ev_2017_austrian_grand_prix([(Start,End) | Tail]) :- assert(star_trek__enterprise_OR_ev_2017_austrian_grand_prix(Start,End)), generate_facts_star_trek__enterprise_OR_ev_2017_austrian_grand_prix(Tail).

star_trek__enterprise_OR_ev_2017_austrian_grand_prix_aux() :- findall((Start,End),star_trek__enterprise(Start,End),Interval1), findall((Start,End),ev_2017_austrian_grand_prix(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_star_trek__enterprise_OR_ev_2017_austrian_grand_prix(Interval).

star_trek__enterprise_OR_ev_2017_austrian_grand_prix_at_1997(Res) :- setof((Start,End),star_trek__enterprise_OR_ev_2017_austrian_grand_prix(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = star_trek__enterprise_OR_ev_2017_austrian_grand_prix_at_1997'), (star_trek__enterprise_OR_ev_2017_austrian_grand_prix_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).
?- star_trek__enterprise_OR_ev_2017_austrian_grand_prix_aux().

