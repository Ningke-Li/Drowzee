:- include('database.pl').
ev_2007_08_uefa_champions_league(Start,End) :- begin('ev_2007_08_uefa_champions_league',_,_,Start), end('ev_2007_08_uefa_champions_league',_,_,End), Start=<End.

private_practice(Start,End) :- begin('private_practice',_,_,Start), end('private_practice',_,_,End), Start=<End.

generate_facts_ev_2007_08_uefa_champions_league_AND_private_practice([]) :- assert(ev_2007_08_uefa_champions_league_AND_private_practice(-1,-1)).

generate_facts_ev_2007_08_uefa_champions_league_AND_private_practice([(Start,End) | Tail]) :- assert(ev_2007_08_uefa_champions_league_AND_private_practice(Start,End)), generate_facts_ev_2007_08_uefa_champions_league_AND_private_practice(Tail).

ev_2007_08_uefa_champions_league_AND_private_practice_aux() :- findall((Start,End),ev_2007_08_uefa_champions_league(Start,End),Interval1), findall((Start,End),private_practice(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2007_08_uefa_champions_league_AND_private_practice(Interval).

ev_2007_08_uefa_champions_league_AND_private_practice_at_1954(Res) :- setof((Start,End),ev_2007_08_uefa_champions_league_AND_private_practice(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = ev_2007_08_uefa_champions_league_AND_private_practice_at_1954'), (ev_2007_08_uefa_champions_league_AND_private_practice_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2007_08_uefa_champions_league_AND_private_practice_aux().

