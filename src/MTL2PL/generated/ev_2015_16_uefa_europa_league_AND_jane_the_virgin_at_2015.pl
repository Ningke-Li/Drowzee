:- include('database.pl').
ev_2015_16_uefa_europa_league(Start,End) :- begin('ev_2015_16_uefa_europa_league',_,_,Start), end('ev_2015_16_uefa_europa_league',_,_,End), Start=<End.

jane_the_virgin(Start,End) :- begin('jane_the_virgin',_,_,Start), end('jane_the_virgin',_,_,End), Start=<End.

generate_facts_ev_2015_16_uefa_europa_league_AND_jane_the_virgin([]) :- assert(ev_2015_16_uefa_europa_league_AND_jane_the_virgin(-1,-1)).

generate_facts_ev_2015_16_uefa_europa_league_AND_jane_the_virgin([(Start,End) | Tail]) :- assert(ev_2015_16_uefa_europa_league_AND_jane_the_virgin(Start,End)), generate_facts_ev_2015_16_uefa_europa_league_AND_jane_the_virgin(Tail).

ev_2015_16_uefa_europa_league_AND_jane_the_virgin_aux() :- findall((Start,End),ev_2015_16_uefa_europa_league(Start,End),Interval1), findall((Start,End),jane_the_virgin(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2015_16_uefa_europa_league_AND_jane_the_virgin(Interval).

ev_2015_16_uefa_europa_league_AND_jane_the_virgin_at_2015(Res) :- setof((Start,End),ev_2015_16_uefa_europa_league_AND_jane_the_virgin(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = ev_2015_16_uefa_europa_league_AND_jane_the_virgin_at_2015'), (ev_2015_16_uefa_europa_league_AND_jane_the_virgin_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2015_16_uefa_europa_league_AND_jane_the_virgin_aux().

