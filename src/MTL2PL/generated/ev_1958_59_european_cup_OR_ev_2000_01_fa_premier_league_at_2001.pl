:- include('database.pl').
ev_1958_59_european_cup(Start,End) :- begin('ev_1958_59_european_cup',_,_,Start), end('ev_1958_59_european_cup',_,_,End), Start=<End.

ev_2000_01_fa_premier_league(Start,End) :- begin('ev_2000_01_fa_premier_league',_,_,Start), end('ev_2000_01_fa_premier_league',_,_,End), Start=<End.

generate_facts_ev_1958_59_european_cup_OR_ev_2000_01_fa_premier_league([]) :- assert(ev_1958_59_european_cup_OR_ev_2000_01_fa_premier_league(-1,-1)).

generate_facts_ev_1958_59_european_cup_OR_ev_2000_01_fa_premier_league([(Start,End) | Tail]) :- assert(ev_1958_59_european_cup_OR_ev_2000_01_fa_premier_league(Start,End)), generate_facts_ev_1958_59_european_cup_OR_ev_2000_01_fa_premier_league(Tail).

ev_1958_59_european_cup_OR_ev_2000_01_fa_premier_league_aux() :- findall((Start,End),ev_1958_59_european_cup(Start,End),Interval1), findall((Start,End),ev_2000_01_fa_premier_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1958_59_european_cup_OR_ev_2000_01_fa_premier_league(Interval).

ev_1958_59_european_cup_OR_ev_2000_01_fa_premier_league_at_2001(Res) :- setof((Start,End),ev_1958_59_european_cup_OR_ev_2000_01_fa_premier_league(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = ev_1958_59_european_cup_OR_ev_2000_01_fa_premier_league_at_2001'), (ev_1958_59_european_cup_OR_ev_2000_01_fa_premier_league_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1958_59_european_cup_OR_ev_2000_01_fa_premier_league_aux().

