:- include('database.pl').
criminal_minds(Start,End) :- begin('criminal_minds',_,_,Start), end('criminal_minds',_,_,End), Start=<End.

ev_2011_12_uefa_champions_league(Start,End) :- begin('ev_2011_12_uefa_champions_league',_,_,Start), end('ev_2011_12_uefa_champions_league',_,_,End), Start=<End.

generate_facts_criminal_minds_AND_ev_2011_12_uefa_champions_league([]) :- assert(criminal_minds_AND_ev_2011_12_uefa_champions_league(-1,-1)).

generate_facts_criminal_minds_AND_ev_2011_12_uefa_champions_league([(Start,End) | Tail]) :- assert(criminal_minds_AND_ev_2011_12_uefa_champions_league(Start,End)), generate_facts_criminal_minds_AND_ev_2011_12_uefa_champions_league(Tail).

criminal_minds_AND_ev_2011_12_uefa_champions_league_aux() :- findall((Start,End),criminal_minds(Start,End),Interval1), findall((Start,End),ev_2011_12_uefa_champions_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_criminal_minds_AND_ev_2011_12_uefa_champions_league(Interval).

criminal_minds_AND_ev_2011_12_uefa_champions_league_at_2011(Res) :- setof((Start,End),criminal_minds_AND_ev_2011_12_uefa_champions_league(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = criminal_minds_AND_ev_2011_12_uefa_champions_league_at_2011'), (criminal_minds_AND_ev_2011_12_uefa_champions_league_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- criminal_minds_AND_ev_2011_12_uefa_champions_league_aux().

