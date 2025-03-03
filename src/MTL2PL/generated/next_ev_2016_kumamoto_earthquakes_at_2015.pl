:- include('database.pl').
ev_2016_kumamoto_earthquakes(Start,End) :- begin('ev_2016_kumamoto_earthquakes',_,_,Start), end('ev_2016_kumamoto_earthquakes',_,_,End), Start=<End.

next_ev_2016_kumamoto_earthquakes(Start,End) :- ev_2016_kumamoto_earthquakes(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2016_kumamoto_earthquakes_at_2015(Res) :- setof((Start,End),next_ev_2016_kumamoto_earthquakes(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = next_ev_2016_kumamoto_earthquakes_at_2015'), (next_ev_2016_kumamoto_earthquakes_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

