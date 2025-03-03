:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

ev_2010_11_premier_league(Start,End) :- begin('ev_2010_11_premier_league',_,_,Start), end('ev_2010_11_premier_league',_,_,End), Start=<End.

generate_facts_vostok_programme_AND_ev_2010_11_premier_league([]) :- assert(vostok_programme_AND_ev_2010_11_premier_league(-1,-1)).

generate_facts_vostok_programme_AND_ev_2010_11_premier_league([(Start,End) | Tail]) :- assert(vostok_programme_AND_ev_2010_11_premier_league(Start,End)), generate_facts_vostok_programme_AND_ev_2010_11_premier_league(Tail).

vostok_programme_AND_ev_2010_11_premier_league_aux() :- findall((Start,End),vostok_programme(Start,End),Interval1), findall((Start,End),ev_2010_11_premier_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_vostok_programme_AND_ev_2010_11_premier_league(Interval).

vostok_programme_AND_ev_2010_11_premier_league_at_1967(Res) :- setof((Start,End),vostok_programme_AND_ev_2010_11_premier_league(Start,End),AllINtervals), checkvalidity(1967,AllINtervals,Res).

check_query() :- write('Query = vostok_programme_AND_ev_2010_11_premier_league_at_1967'), (vostok_programme_AND_ev_2010_11_premier_league_at_1967(true) -> write('\nRes   = true');write('\nRes   = false')).
?- vostok_programme_AND_ev_2010_11_premier_league_aux().

