:- include('database.pl').
fencing_at_the_2016_summer_olympics(Start,End) :- begin('fencing_at_the_2016_summer_olympics',_,_,Start), end('fencing_at_the_2016_summer_olympics',_,_,End), Start=<End.

ev_2005_06_uefa_champions_league(Start,End) :- begin('ev_2005_06_uefa_champions_league',_,_,Start), end('ev_2005_06_uefa_champions_league',_,_,End), Start=<End.

generate_facts_fencing_at_the_2016_summer_olympics_OR_ev_2005_06_uefa_champions_league([]) :- assert(fencing_at_the_2016_summer_olympics_OR_ev_2005_06_uefa_champions_league(-1,-1)).

generate_facts_fencing_at_the_2016_summer_olympics_OR_ev_2005_06_uefa_champions_league([(Start,End) | Tail]) :- assert(fencing_at_the_2016_summer_olympics_OR_ev_2005_06_uefa_champions_league(Start,End)), generate_facts_fencing_at_the_2016_summer_olympics_OR_ev_2005_06_uefa_champions_league(Tail).

fencing_at_the_2016_summer_olympics_OR_ev_2005_06_uefa_champions_league_aux() :- findall((Start,End),fencing_at_the_2016_summer_olympics(Start,End),Interval1), findall((Start,End),ev_2005_06_uefa_champions_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_fencing_at_the_2016_summer_olympics_OR_ev_2005_06_uefa_champions_league(Interval).

fencing_at_the_2016_summer_olympics_OR_ev_2005_06_uefa_champions_league_at_2044(Res) :- setof((Start,End),fencing_at_the_2016_summer_olympics_OR_ev_2005_06_uefa_champions_league(Start,End),AllINtervals), checkvalidity(2044,AllINtervals,Res).

check_query() :- write('Query = fencing_at_the_2016_summer_olympics_OR_ev_2005_06_uefa_champions_league_at_2044'), (fencing_at_the_2016_summer_olympics_OR_ev_2005_06_uefa_champions_league_at_2044(true) -> write('\nRes   = true');write('\nRes   = false')).
?- fencing_at_the_2016_summer_olympics_OR_ev_2005_06_uefa_champions_league_aux().

