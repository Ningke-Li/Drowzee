:- include('database.pl').
sayfo(Start,End) :- begin('sayfo',_,_,Start), end('sayfo',_,_,End), Start=<End.

ev_2010_11_uefa_champions_league(Start,End) :- begin('ev_2010_11_uefa_champions_league',_,_,Start), end('ev_2010_11_uefa_champions_league',_,_,End), Start=<End.

generate_facts_sayfo_OR_ev_2010_11_uefa_champions_league([]) :- assert(sayfo_OR_ev_2010_11_uefa_champions_league(-1,-1)).

generate_facts_sayfo_OR_ev_2010_11_uefa_champions_league([(Start,End) | Tail]) :- assert(sayfo_OR_ev_2010_11_uefa_champions_league(Start,End)), generate_facts_sayfo_OR_ev_2010_11_uefa_champions_league(Tail).

sayfo_OR_ev_2010_11_uefa_champions_league_aux() :- findall((Start,End),sayfo(Start,End),Interval1), findall((Start,End),ev_2010_11_uefa_champions_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_sayfo_OR_ev_2010_11_uefa_champions_league(Interval).

sayfo_OR_ev_2010_11_uefa_champions_league_at_1807(Res) :- setof((Start,End),sayfo_OR_ev_2010_11_uefa_champions_league(Start,End),AllINtervals), checkvalidity(1807,AllINtervals,Res).

check_query() :- write('Query = sayfo_OR_ev_2010_11_uefa_champions_league_at_1807'), (sayfo_OR_ev_2010_11_uefa_champions_league_at_1807(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sayfo_OR_ev_2010_11_uefa_champions_league_aux().

