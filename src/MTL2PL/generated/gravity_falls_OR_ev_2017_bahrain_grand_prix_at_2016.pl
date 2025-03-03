:- include('database.pl').
gravity_falls(Start,End) :- begin('gravity_falls',_,_,Start), end('gravity_falls',_,_,End), Start=<End.

ev_2017_bahrain_grand_prix(Start,End) :- begin('ev_2017_bahrain_grand_prix',_,_,Start), end('ev_2017_bahrain_grand_prix',_,_,End), Start=<End.

generate_facts_gravity_falls_OR_ev_2017_bahrain_grand_prix([]) :- assert(gravity_falls_OR_ev_2017_bahrain_grand_prix(-1,-1)).

generate_facts_gravity_falls_OR_ev_2017_bahrain_grand_prix([(Start,End) | Tail]) :- assert(gravity_falls_OR_ev_2017_bahrain_grand_prix(Start,End)), generate_facts_gravity_falls_OR_ev_2017_bahrain_grand_prix(Tail).

gravity_falls_OR_ev_2017_bahrain_grand_prix_aux() :- findall((Start,End),gravity_falls(Start,End),Interval1), findall((Start,End),ev_2017_bahrain_grand_prix(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_gravity_falls_OR_ev_2017_bahrain_grand_prix(Interval).

gravity_falls_OR_ev_2017_bahrain_grand_prix_at_2016(Res) :- setof((Start,End),gravity_falls_OR_ev_2017_bahrain_grand_prix(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = gravity_falls_OR_ev_2017_bahrain_grand_prix_at_2016'), (gravity_falls_OR_ev_2017_bahrain_grand_prix_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- gravity_falls_OR_ev_2017_bahrain_grand_prix_aux().

