:- include('database.pl').
ev_2005_06_uefa_champions_league(Start,End) :- begin('ev_2005_06_uefa_champions_league',_,_,Start), end('ev_2005_06_uefa_champions_league',_,_,End), Start=<End.

drake___josh(Start,End) :- begin('drake___josh',_,_,Start), end('drake___josh',_,_,End), Start=<End.

generate_facts_ev_2005_06_uefa_champions_league_OR_drake___josh([]) :- assert(ev_2005_06_uefa_champions_league_OR_drake___josh(-1,-1)).

generate_facts_ev_2005_06_uefa_champions_league_OR_drake___josh([(Start,End) | Tail]) :- assert(ev_2005_06_uefa_champions_league_OR_drake___josh(Start,End)), generate_facts_ev_2005_06_uefa_champions_league_OR_drake___josh(Tail).

ev_2005_06_uefa_champions_league_OR_drake___josh_aux() :- findall((Start,End),ev_2005_06_uefa_champions_league(Start,End),Interval1), findall((Start,End),drake___josh(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2005_06_uefa_champions_league_OR_drake___josh(Interval).

ev_2005_06_uefa_champions_league_OR_drake___josh_at_1925(Res) :- setof((Start,End),ev_2005_06_uefa_champions_league_OR_drake___josh(Start,End),AllINtervals), checkvalidity(1925,AllINtervals,Res).

check_query() :- write('Query = ev_2005_06_uefa_champions_league_OR_drake___josh_at_1925'), (ev_2005_06_uefa_champions_league_OR_drake___josh_at_1925(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2005_06_uefa_champions_league_OR_drake___josh_aux().

