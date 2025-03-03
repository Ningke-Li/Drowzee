:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

ev_2007_08_uefa_champions_league(Start,End) :- begin('ev_2007_08_uefa_champions_league',_,_,Start), end('ev_2007_08_uefa_champions_league',_,_,End), Start=<End.

generate_facts_samurai_jack_OR_ev_2007_08_uefa_champions_league([]) :- assert(samurai_jack_OR_ev_2007_08_uefa_champions_league(-1,-1)).

generate_facts_samurai_jack_OR_ev_2007_08_uefa_champions_league([(Start,End) | Tail]) :- assert(samurai_jack_OR_ev_2007_08_uefa_champions_league(Start,End)), generate_facts_samurai_jack_OR_ev_2007_08_uefa_champions_league(Tail).

samurai_jack_OR_ev_2007_08_uefa_champions_league_aux() :- findall((Start,End),samurai_jack(Start,End),Interval1), findall((Start,End),ev_2007_08_uefa_champions_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_samurai_jack_OR_ev_2007_08_uefa_champions_league(Interval).

samurai_jack_OR_ev_2007_08_uefa_champions_league_at_2010(Res) :- setof((Start,End),samurai_jack_OR_ev_2007_08_uefa_champions_league(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = samurai_jack_OR_ev_2007_08_uefa_champions_league_at_2010'), (samurai_jack_OR_ev_2007_08_uefa_champions_league_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- samurai_jack_OR_ev_2007_08_uefa_champions_league_aux().

