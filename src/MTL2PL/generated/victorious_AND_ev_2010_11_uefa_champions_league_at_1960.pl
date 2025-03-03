:- include('database.pl').
victorious(Start,End) :- begin('victorious',_,_,Start), end('victorious',_,_,End), Start=<End.

ev_2010_11_uefa_champions_league(Start,End) :- begin('ev_2010_11_uefa_champions_league',_,_,Start), end('ev_2010_11_uefa_champions_league',_,_,End), Start=<End.

generate_facts_victorious_AND_ev_2010_11_uefa_champions_league([]) :- assert(victorious_AND_ev_2010_11_uefa_champions_league(-1,-1)).

generate_facts_victorious_AND_ev_2010_11_uefa_champions_league([(Start,End) | Tail]) :- assert(victorious_AND_ev_2010_11_uefa_champions_league(Start,End)), generate_facts_victorious_AND_ev_2010_11_uefa_champions_league(Tail).

victorious_AND_ev_2010_11_uefa_champions_league_aux() :- findall((Start,End),victorious(Start,End),Interval1), findall((Start,End),ev_2010_11_uefa_champions_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_victorious_AND_ev_2010_11_uefa_champions_league(Interval).

victorious_AND_ev_2010_11_uefa_champions_league_at_1960(Res) :- setof((Start,End),victorious_AND_ev_2010_11_uefa_champions_league(Start,End),AllINtervals), checkvalidity(1960,AllINtervals,Res).

check_query() :- write('Query = victorious_AND_ev_2010_11_uefa_champions_league_at_1960'), (victorious_AND_ev_2010_11_uefa_champions_league_at_1960(true) -> write('\nRes   = true');write('\nRes   = false')).
?- victorious_AND_ev_2010_11_uefa_champions_league_aux().

