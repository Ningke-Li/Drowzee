:- include('database.pl').
ev_2007_08_premier_league(Start,End) :- begin('ev_2007_08_premier_league',_,_,Start), end('ev_2007_08_premier_league',_,_,End), Start=<End.

totally_spies_(Start,End) :- begin('totally_spies_',_,_,Start), end('totally_spies_',_,_,End), Start=<End.

generate_facts_ev_2007_08_premier_league_AND_totally_spies_([]) :- assert(ev_2007_08_premier_league_AND_totally_spies_(-1,-1)).

generate_facts_ev_2007_08_premier_league_AND_totally_spies_([(Start,End) | Tail]) :- assert(ev_2007_08_premier_league_AND_totally_spies_(Start,End)), generate_facts_ev_2007_08_premier_league_AND_totally_spies_(Tail).

ev_2007_08_premier_league_AND_totally_spies__aux() :- findall((Start,End),ev_2007_08_premier_league(Start,End),Interval1), findall((Start,End),totally_spies_(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2007_08_premier_league_AND_totally_spies_(Interval).

ev_2007_08_premier_league_AND_totally_spies__at_2007(Res) :- setof((Start,End),ev_2007_08_premier_league_AND_totally_spies_(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = ev_2007_08_premier_league_AND_totally_spies__at_2007'), (ev_2007_08_premier_league_AND_totally_spies__at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2007_08_premier_league_AND_totally_spies__aux().

