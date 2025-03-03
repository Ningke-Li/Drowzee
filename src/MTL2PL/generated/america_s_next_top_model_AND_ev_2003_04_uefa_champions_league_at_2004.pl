:- include('database.pl').
america_s_next_top_model(Start,End) :- begin('america_s_next_top_model',_,_,Start), end('america_s_next_top_model',_,_,End), Start=<End.

ev_2003_04_uefa_champions_league(Start,End) :- begin('ev_2003_04_uefa_champions_league',_,_,Start), end('ev_2003_04_uefa_champions_league',_,_,End), Start=<End.

generate_facts_america_s_next_top_model_AND_ev_2003_04_uefa_champions_league([]) :- assert(america_s_next_top_model_AND_ev_2003_04_uefa_champions_league(-1,-1)).

generate_facts_america_s_next_top_model_AND_ev_2003_04_uefa_champions_league([(Start,End) | Tail]) :- assert(america_s_next_top_model_AND_ev_2003_04_uefa_champions_league(Start,End)), generate_facts_america_s_next_top_model_AND_ev_2003_04_uefa_champions_league(Tail).

america_s_next_top_model_AND_ev_2003_04_uefa_champions_league_aux() :- findall((Start,End),america_s_next_top_model(Start,End),Interval1), findall((Start,End),ev_2003_04_uefa_champions_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_america_s_next_top_model_AND_ev_2003_04_uefa_champions_league(Interval).

america_s_next_top_model_AND_ev_2003_04_uefa_champions_league_at_2004(Res) :- setof((Start,End),america_s_next_top_model_AND_ev_2003_04_uefa_champions_league(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = america_s_next_top_model_AND_ev_2003_04_uefa_champions_league_at_2004'), (america_s_next_top_model_AND_ev_2003_04_uefa_champions_league_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- america_s_next_top_model_AND_ev_2003_04_uefa_champions_league_aux().

