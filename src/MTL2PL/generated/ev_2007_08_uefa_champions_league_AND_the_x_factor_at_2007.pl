:- include('database.pl').
ev_2007_08_uefa_champions_league(Start,End) :- begin('ev_2007_08_uefa_champions_league',_,_,Start), end('ev_2007_08_uefa_champions_league',_,_,End), Start=<End.

the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

generate_facts_ev_2007_08_uefa_champions_league_AND_the_x_factor([]) :- assert(ev_2007_08_uefa_champions_league_AND_the_x_factor(-1,-1)).

generate_facts_ev_2007_08_uefa_champions_league_AND_the_x_factor([(Start,End) | Tail]) :- assert(ev_2007_08_uefa_champions_league_AND_the_x_factor(Start,End)), generate_facts_ev_2007_08_uefa_champions_league_AND_the_x_factor(Tail).

ev_2007_08_uefa_champions_league_AND_the_x_factor_aux() :- findall((Start,End),ev_2007_08_uefa_champions_league(Start,End),Interval1), findall((Start,End),the_x_factor(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2007_08_uefa_champions_league_AND_the_x_factor(Interval).

ev_2007_08_uefa_champions_league_AND_the_x_factor_at_2007(Res) :- setof((Start,End),ev_2007_08_uefa_champions_league_AND_the_x_factor(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = ev_2007_08_uefa_champions_league_AND_the_x_factor_at_2007'), (ev_2007_08_uefa_champions_league_AND_the_x_factor_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2007_08_uefa_champions_league_AND_the_x_factor_aux().

