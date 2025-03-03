:- include('database.pl').
second_battle_of_the_marne(Start,End) :- begin('second_battle_of_the_marne',_,_,Start), end('second_battle_of_the_marne',_,_,End), Start=<End.

ev_2001_02_uefa_champions_league(Start,End) :- begin('ev_2001_02_uefa_champions_league',_,_,Start), end('ev_2001_02_uefa_champions_league',_,_,End), Start=<End.

generate_facts_second_battle_of_the_marne_OR_ev_2001_02_uefa_champions_league([]) :- assert(second_battle_of_the_marne_OR_ev_2001_02_uefa_champions_league(-1,-1)).

generate_facts_second_battle_of_the_marne_OR_ev_2001_02_uefa_champions_league([(Start,End) | Tail]) :- assert(second_battle_of_the_marne_OR_ev_2001_02_uefa_champions_league(Start,End)), generate_facts_second_battle_of_the_marne_OR_ev_2001_02_uefa_champions_league(Tail).

second_battle_of_the_marne_OR_ev_2001_02_uefa_champions_league_aux() :- findall((Start,End),second_battle_of_the_marne(Start,End),Interval1), findall((Start,End),ev_2001_02_uefa_champions_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_second_battle_of_the_marne_OR_ev_2001_02_uefa_champions_league(Interval).

second_battle_of_the_marne_OR_ev_2001_02_uefa_champions_league_at_1904(Res) :- setof((Start,End),second_battle_of_the_marne_OR_ev_2001_02_uefa_champions_league(Start,End),AllINtervals), checkvalidity(1904,AllINtervals,Res).

check_query() :- write('Query = second_battle_of_the_marne_OR_ev_2001_02_uefa_champions_league_at_1904'), (second_battle_of_the_marne_OR_ev_2001_02_uefa_champions_league_at_1904(true) -> write('\nRes   = true');write('\nRes   = false')).
?- second_battle_of_the_marne_OR_ev_2001_02_uefa_champions_league_aux().

