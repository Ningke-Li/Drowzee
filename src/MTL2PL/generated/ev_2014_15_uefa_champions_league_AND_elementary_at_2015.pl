:- include('database.pl').
ev_2014_15_uefa_champions_league(Start,End) :- begin('ev_2014_15_uefa_champions_league',_,_,Start), end('ev_2014_15_uefa_champions_league',_,_,End), Start=<End.

elementary(Start,End) :- begin('elementary',_,_,Start), end('elementary',_,_,End), Start=<End.

generate_facts_ev_2014_15_uefa_champions_league_AND_elementary([]) :- assert(ev_2014_15_uefa_champions_league_AND_elementary(-1,-1)).

generate_facts_ev_2014_15_uefa_champions_league_AND_elementary([(Start,End) | Tail]) :- assert(ev_2014_15_uefa_champions_league_AND_elementary(Start,End)), generate_facts_ev_2014_15_uefa_champions_league_AND_elementary(Tail).

ev_2014_15_uefa_champions_league_AND_elementary_aux() :- findall((Start,End),ev_2014_15_uefa_champions_league(Start,End),Interval1), findall((Start,End),elementary(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2014_15_uefa_champions_league_AND_elementary(Interval).

ev_2014_15_uefa_champions_league_AND_elementary_at_2015(Res) :- setof((Start,End),ev_2014_15_uefa_champions_league_AND_elementary(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = ev_2014_15_uefa_champions_league_AND_elementary_at_2015'), (ev_2014_15_uefa_champions_league_AND_elementary_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_15_uefa_champions_league_AND_elementary_aux().

