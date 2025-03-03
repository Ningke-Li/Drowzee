:- include('database.pl').
ev_2005_06_uefa_champions_league(Start,End) :- begin('ev_2005_06_uefa_champions_league',_,_,Start), end('ev_2005_06_uefa_champions_league',_,_,End), Start=<End.

the_expanse(Start,End) :- begin('the_expanse',_,_,Start), end('the_expanse',_,_,End), Start=<End.

generate_facts_ev_2005_06_uefa_champions_league_OR_the_expanse([]) :- assert(ev_2005_06_uefa_champions_league_OR_the_expanse(-1,-1)).

generate_facts_ev_2005_06_uefa_champions_league_OR_the_expanse([(Start,End) | Tail]) :- assert(ev_2005_06_uefa_champions_league_OR_the_expanse(Start,End)), generate_facts_ev_2005_06_uefa_champions_league_OR_the_expanse(Tail).

ev_2005_06_uefa_champions_league_OR_the_expanse_aux() :- findall((Start,End),ev_2005_06_uefa_champions_league(Start,End),Interval1), findall((Start,End),the_expanse(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2005_06_uefa_champions_league_OR_the_expanse(Interval).

ev_2005_06_uefa_champions_league_OR_the_expanse_at_2020(Res) :- setof((Start,End),ev_2005_06_uefa_champions_league_OR_the_expanse(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = ev_2005_06_uefa_champions_league_OR_the_expanse_at_2020'), (ev_2005_06_uefa_champions_league_OR_the_expanse_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2005_06_uefa_champions_league_OR_the_expanse_aux().

