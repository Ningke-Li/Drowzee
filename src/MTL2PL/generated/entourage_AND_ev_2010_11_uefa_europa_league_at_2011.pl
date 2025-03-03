:- include('database.pl').
entourage(Start,End) :- begin('entourage',_,_,Start), end('entourage',_,_,End), Start=<End.

ev_2010_11_uefa_europa_league(Start,End) :- begin('ev_2010_11_uefa_europa_league',_,_,Start), end('ev_2010_11_uefa_europa_league',_,_,End), Start=<End.

generate_facts_entourage_AND_ev_2010_11_uefa_europa_league([]) :- assert(entourage_AND_ev_2010_11_uefa_europa_league(-1,-1)).

generate_facts_entourage_AND_ev_2010_11_uefa_europa_league([(Start,End) | Tail]) :- assert(entourage_AND_ev_2010_11_uefa_europa_league(Start,End)), generate_facts_entourage_AND_ev_2010_11_uefa_europa_league(Tail).

entourage_AND_ev_2010_11_uefa_europa_league_aux() :- findall((Start,End),entourage(Start,End),Interval1), findall((Start,End),ev_2010_11_uefa_europa_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_entourage_AND_ev_2010_11_uefa_europa_league(Interval).

entourage_AND_ev_2010_11_uefa_europa_league_at_2011(Res) :- setof((Start,End),entourage_AND_ev_2010_11_uefa_europa_league(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = entourage_AND_ev_2010_11_uefa_europa_league_at_2011'), (entourage_AND_ev_2010_11_uefa_europa_league_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- entourage_AND_ev_2010_11_uefa_europa_league_aux().

