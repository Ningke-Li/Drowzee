:- include('database.pl').
ev_2001_02_uefa_champions_league(Start,End) :- begin('ev_2001_02_uefa_champions_league',_,_,Start), end('ev_2001_02_uefa_champions_league',_,_,End), Start=<End.

ev_2010_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2010_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2010_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

generate_facts_ev_2001_02_uefa_champions_league_OR_ev_2010_fifa_world_cup_qualification__conmebol_([]) :- assert(ev_2001_02_uefa_champions_league_OR_ev_2010_fifa_world_cup_qualification__conmebol_(-1,-1)).

generate_facts_ev_2001_02_uefa_champions_league_OR_ev_2010_fifa_world_cup_qualification__conmebol_([(Start,End) | Tail]) :- assert(ev_2001_02_uefa_champions_league_OR_ev_2010_fifa_world_cup_qualification__conmebol_(Start,End)), generate_facts_ev_2001_02_uefa_champions_league_OR_ev_2010_fifa_world_cup_qualification__conmebol_(Tail).

ev_2001_02_uefa_champions_league_OR_ev_2010_fifa_world_cup_qualification__conmebol__aux() :- findall((Start,End),ev_2001_02_uefa_champions_league(Start,End),Interval1), findall((Start,End),ev_2010_fifa_world_cup_qualification__conmebol_(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2001_02_uefa_champions_league_OR_ev_2010_fifa_world_cup_qualification__conmebol_(Interval).

ev_2001_02_uefa_champions_league_OR_ev_2010_fifa_world_cup_qualification__conmebol__at_2008(Res) :- setof((Start,End),ev_2001_02_uefa_champions_league_OR_ev_2010_fifa_world_cup_qualification__conmebol_(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = ev_2001_02_uefa_champions_league_OR_ev_2010_fifa_world_cup_qualification__conmebol__at_2008'), (ev_2001_02_uefa_champions_league_OR_ev_2010_fifa_world_cup_qualification__conmebol__at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2001_02_uefa_champions_league_OR_ev_2010_fifa_world_cup_qualification__conmebol__aux().

