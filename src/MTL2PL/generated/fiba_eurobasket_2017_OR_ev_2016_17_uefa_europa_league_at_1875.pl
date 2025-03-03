:- include('database.pl').
fiba_eurobasket_2017(Start,End) :- begin('fiba_eurobasket_2017',_,_,Start), end('fiba_eurobasket_2017',_,_,End), Start=<End.

ev_2016_17_uefa_europa_league(Start,End) :- begin('ev_2016_17_uefa_europa_league',_,_,Start), end('ev_2016_17_uefa_europa_league',_,_,End), Start=<End.

generate_facts_fiba_eurobasket_2017_OR_ev_2016_17_uefa_europa_league([]) :- assert(fiba_eurobasket_2017_OR_ev_2016_17_uefa_europa_league(-1,-1)).

generate_facts_fiba_eurobasket_2017_OR_ev_2016_17_uefa_europa_league([(Start,End) | Tail]) :- assert(fiba_eurobasket_2017_OR_ev_2016_17_uefa_europa_league(Start,End)), generate_facts_fiba_eurobasket_2017_OR_ev_2016_17_uefa_europa_league(Tail).

fiba_eurobasket_2017_OR_ev_2016_17_uefa_europa_league_aux() :- findall((Start,End),fiba_eurobasket_2017(Start,End),Interval1), findall((Start,End),ev_2016_17_uefa_europa_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_fiba_eurobasket_2017_OR_ev_2016_17_uefa_europa_league(Interval).

fiba_eurobasket_2017_OR_ev_2016_17_uefa_europa_league_at_1875(Res) :- setof((Start,End),fiba_eurobasket_2017_OR_ev_2016_17_uefa_europa_league(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = fiba_eurobasket_2017_OR_ev_2016_17_uefa_europa_league_at_1875'), (fiba_eurobasket_2017_OR_ev_2016_17_uefa_europa_league_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).
?- fiba_eurobasket_2017_OR_ev_2016_17_uefa_europa_league_aux().

