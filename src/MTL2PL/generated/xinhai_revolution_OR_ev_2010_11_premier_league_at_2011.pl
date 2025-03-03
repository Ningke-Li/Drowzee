:- include('database.pl').
xinhai_revolution(Start,End) :- begin('xinhai_revolution',_,_,Start), end('xinhai_revolution',_,_,End), Start=<End.

ev_2010_11_premier_league(Start,End) :- begin('ev_2010_11_premier_league',_,_,Start), end('ev_2010_11_premier_league',_,_,End), Start=<End.

generate_facts_xinhai_revolution_OR_ev_2010_11_premier_league([]) :- assert(xinhai_revolution_OR_ev_2010_11_premier_league(-1,-1)).

generate_facts_xinhai_revolution_OR_ev_2010_11_premier_league([(Start,End) | Tail]) :- assert(xinhai_revolution_OR_ev_2010_11_premier_league(Start,End)), generate_facts_xinhai_revolution_OR_ev_2010_11_premier_league(Tail).

xinhai_revolution_OR_ev_2010_11_premier_league_aux() :- findall((Start,End),xinhai_revolution(Start,End),Interval1), findall((Start,End),ev_2010_11_premier_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_xinhai_revolution_OR_ev_2010_11_premier_league(Interval).

xinhai_revolution_OR_ev_2010_11_premier_league_at_2011(Res) :- setof((Start,End),xinhai_revolution_OR_ev_2010_11_premier_league(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = xinhai_revolution_OR_ev_2010_11_premier_league_at_2011'), (xinhai_revolution_OR_ev_2010_11_premier_league_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- xinhai_revolution_OR_ev_2010_11_premier_league_aux().

