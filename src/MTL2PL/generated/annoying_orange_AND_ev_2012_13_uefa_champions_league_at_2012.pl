:- include('database.pl').
annoying_orange(Start,End) :- begin('annoying_orange',_,_,Start), end('annoying_orange',_,_,End), Start=<End.

ev_2012_13_uefa_champions_league(Start,End) :- begin('ev_2012_13_uefa_champions_league',_,_,Start), end('ev_2012_13_uefa_champions_league',_,_,End), Start=<End.

generate_facts_annoying_orange_AND_ev_2012_13_uefa_champions_league([]) :- assert(annoying_orange_AND_ev_2012_13_uefa_champions_league(-1,-1)).

generate_facts_annoying_orange_AND_ev_2012_13_uefa_champions_league([(Start,End) | Tail]) :- assert(annoying_orange_AND_ev_2012_13_uefa_champions_league(Start,End)), generate_facts_annoying_orange_AND_ev_2012_13_uefa_champions_league(Tail).

annoying_orange_AND_ev_2012_13_uefa_champions_league_aux() :- findall((Start,End),annoying_orange(Start,End),Interval1), findall((Start,End),ev_2012_13_uefa_champions_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_annoying_orange_AND_ev_2012_13_uefa_champions_league(Interval).

annoying_orange_AND_ev_2012_13_uefa_champions_league_at_2012(Res) :- setof((Start,End),annoying_orange_AND_ev_2012_13_uefa_champions_league(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = annoying_orange_AND_ev_2012_13_uefa_champions_league_at_2012'), (annoying_orange_AND_ev_2012_13_uefa_champions_league_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- annoying_orange_AND_ev_2012_13_uefa_champions_league_aux().

