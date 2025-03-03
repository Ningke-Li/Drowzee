:- include('database.pl').
supernatural(Start,End) :- begin('supernatural',_,_,Start), end('supernatural',_,_,End), Start=<End.

ev_2010_11_uefa_champions_league(Start,End) :- begin('ev_2010_11_uefa_champions_league',_,_,Start), end('ev_2010_11_uefa_champions_league',_,_,End), Start=<End.

generate_facts_supernatural_AND_ev_2010_11_uefa_champions_league([]) :- assert(supernatural_AND_ev_2010_11_uefa_champions_league(-1,-1)).

generate_facts_supernatural_AND_ev_2010_11_uefa_champions_league([(Start,End) | Tail]) :- assert(supernatural_AND_ev_2010_11_uefa_champions_league(Start,End)), generate_facts_supernatural_AND_ev_2010_11_uefa_champions_league(Tail).

supernatural_AND_ev_2010_11_uefa_champions_league_aux() :- findall((Start,End),supernatural(Start,End),Interval1), findall((Start,End),ev_2010_11_uefa_champions_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_supernatural_AND_ev_2010_11_uefa_champions_league(Interval).

supernatural_AND_ev_2010_11_uefa_champions_league_at_2011(Res) :- setof((Start,End),supernatural_AND_ev_2010_11_uefa_champions_league(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = supernatural_AND_ev_2010_11_uefa_champions_league_at_2011'), (supernatural_AND_ev_2010_11_uefa_champions_league_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- supernatural_AND_ev_2010_11_uefa_champions_league_aux().

