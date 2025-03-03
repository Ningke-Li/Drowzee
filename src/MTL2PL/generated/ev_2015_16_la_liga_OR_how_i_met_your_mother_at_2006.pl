:- include('database.pl').
ev_2015_16_la_liga(Start,End) :- begin('ev_2015_16_la_liga',_,_,Start), end('ev_2015_16_la_liga',_,_,End), Start=<End.

how_i_met_your_mother(Start,End) :- begin('how_i_met_your_mother',_,_,Start), end('how_i_met_your_mother',_,_,End), Start=<End.

generate_facts_ev_2015_16_la_liga_OR_how_i_met_your_mother([]) :- assert(ev_2015_16_la_liga_OR_how_i_met_your_mother(-1,-1)).

generate_facts_ev_2015_16_la_liga_OR_how_i_met_your_mother([(Start,End) | Tail]) :- assert(ev_2015_16_la_liga_OR_how_i_met_your_mother(Start,End)), generate_facts_ev_2015_16_la_liga_OR_how_i_met_your_mother(Tail).

ev_2015_16_la_liga_OR_how_i_met_your_mother_aux() :- findall((Start,End),ev_2015_16_la_liga(Start,End),Interval1), findall((Start,End),how_i_met_your_mother(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2015_16_la_liga_OR_how_i_met_your_mother(Interval).

ev_2015_16_la_liga_OR_how_i_met_your_mother_at_2006(Res) :- setof((Start,End),ev_2015_16_la_liga_OR_how_i_met_your_mother(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = ev_2015_16_la_liga_OR_how_i_met_your_mother_at_2006'), (ev_2015_16_la_liga_OR_how_i_met_your_mother_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2015_16_la_liga_OR_how_i_met_your_mother_aux().

