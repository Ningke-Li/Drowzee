:- include('database.pl').
ev_2002_african_cup_of_nations(Start,End) :- begin('ev_2002_african_cup_of_nations',_,_,Start), end('ev_2002_african_cup_of_nations',_,_,End), Start=<End.

warsaw_ghetto(Start,End) :- begin('warsaw_ghetto',_,_,Start), end('warsaw_ghetto',_,_,End), Start=<End.

generate_facts_ev_2002_african_cup_of_nations_OR_warsaw_ghetto([]) :- assert(ev_2002_african_cup_of_nations_OR_warsaw_ghetto(-1,-1)).

generate_facts_ev_2002_african_cup_of_nations_OR_warsaw_ghetto([(Start,End) | Tail]) :- assert(ev_2002_african_cup_of_nations_OR_warsaw_ghetto(Start,End)), generate_facts_ev_2002_african_cup_of_nations_OR_warsaw_ghetto(Tail).

ev_2002_african_cup_of_nations_OR_warsaw_ghetto_aux() :- findall((Start,End),ev_2002_african_cup_of_nations(Start,End),Interval1), findall((Start,End),warsaw_ghetto(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2002_african_cup_of_nations_OR_warsaw_ghetto(Interval).

ev_2002_african_cup_of_nations_OR_warsaw_ghetto_at_1942(Res) :- setof((Start,End),ev_2002_african_cup_of_nations_OR_warsaw_ghetto(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = ev_2002_african_cup_of_nations_OR_warsaw_ghetto_at_1942'), (ev_2002_african_cup_of_nations_OR_warsaw_ghetto_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2002_african_cup_of_nations_OR_warsaw_ghetto_aux().

