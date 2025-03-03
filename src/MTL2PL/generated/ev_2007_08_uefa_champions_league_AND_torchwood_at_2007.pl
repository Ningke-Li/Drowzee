:- include('database.pl').
ev_2007_08_uefa_champions_league(Start,End) :- begin('ev_2007_08_uefa_champions_league',_,_,Start), end('ev_2007_08_uefa_champions_league',_,_,End), Start=<End.

torchwood(Start,End) :- begin('torchwood',_,_,Start), end('torchwood',_,_,End), Start=<End.

generate_facts_ev_2007_08_uefa_champions_league_AND_torchwood([]) :- assert(ev_2007_08_uefa_champions_league_AND_torchwood(-1,-1)).

generate_facts_ev_2007_08_uefa_champions_league_AND_torchwood([(Start,End) | Tail]) :- assert(ev_2007_08_uefa_champions_league_AND_torchwood(Start,End)), generate_facts_ev_2007_08_uefa_champions_league_AND_torchwood(Tail).

ev_2007_08_uefa_champions_league_AND_torchwood_aux() :- findall((Start,End),ev_2007_08_uefa_champions_league(Start,End),Interval1), findall((Start,End),torchwood(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2007_08_uefa_champions_league_AND_torchwood(Interval).

ev_2007_08_uefa_champions_league_AND_torchwood_at_2007(Res) :- setof((Start,End),ev_2007_08_uefa_champions_league_AND_torchwood(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = ev_2007_08_uefa_champions_league_AND_torchwood_at_2007'), (ev_2007_08_uefa_champions_league_AND_torchwood_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2007_08_uefa_champions_league_AND_torchwood_aux().

