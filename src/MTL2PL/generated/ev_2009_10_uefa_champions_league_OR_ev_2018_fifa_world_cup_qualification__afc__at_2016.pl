:- include('database.pl').
ev_2009_10_uefa_champions_league(Start,End) :- begin('ev_2009_10_uefa_champions_league',_,_,Start), end('ev_2009_10_uefa_champions_league',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification__afc_(Start,End) :- begin('ev_2018_fifa_world_cup_qualification__afc_',_,_,Start), end('ev_2018_fifa_world_cup_qualification__afc_',_,_,End), Start=<End.

generate_facts_ev_2009_10_uefa_champions_league_OR_ev_2018_fifa_world_cup_qualification__afc_([]) :- assert(ev_2009_10_uefa_champions_league_OR_ev_2018_fifa_world_cup_qualification__afc_(-1,-1)).

generate_facts_ev_2009_10_uefa_champions_league_OR_ev_2018_fifa_world_cup_qualification__afc_([(Start,End) | Tail]) :- assert(ev_2009_10_uefa_champions_league_OR_ev_2018_fifa_world_cup_qualification__afc_(Start,End)), generate_facts_ev_2009_10_uefa_champions_league_OR_ev_2018_fifa_world_cup_qualification__afc_(Tail).

ev_2009_10_uefa_champions_league_OR_ev_2018_fifa_world_cup_qualification__afc__aux() :- findall((Start,End),ev_2009_10_uefa_champions_league(Start,End),Interval1), findall((Start,End),ev_2018_fifa_world_cup_qualification__afc_(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2009_10_uefa_champions_league_OR_ev_2018_fifa_world_cup_qualification__afc_(Interval).

ev_2009_10_uefa_champions_league_OR_ev_2018_fifa_world_cup_qualification__afc__at_2016(Res) :- setof((Start,End),ev_2009_10_uefa_champions_league_OR_ev_2018_fifa_world_cup_qualification__afc_(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = ev_2009_10_uefa_champions_league_OR_ev_2018_fifa_world_cup_qualification__afc__at_2016'), (ev_2009_10_uefa_champions_league_OR_ev_2018_fifa_world_cup_qualification__afc__at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2009_10_uefa_champions_league_OR_ev_2018_fifa_world_cup_qualification__afc__aux().

