:- include('database.pl').
ev_1788_89_united_states_presidential_election(Start,End) :- begin('ev_1788_89_united_states_presidential_election',_,_,Start), end('ev_1788_89_united_states_presidential_election',_,_,End), Start=<End.

ev_2010_11_premier_league(Start,End) :- begin('ev_2010_11_premier_league',_,_,Start), end('ev_2010_11_premier_league',_,_,End), Start=<End.

generate_facts_ev_1788_89_united_states_presidential_election_OR_ev_2010_11_premier_league([]) :- assert(ev_1788_89_united_states_presidential_election_OR_ev_2010_11_premier_league(-1,-1)).

generate_facts_ev_1788_89_united_states_presidential_election_OR_ev_2010_11_premier_league([(Start,End) | Tail]) :- assert(ev_1788_89_united_states_presidential_election_OR_ev_2010_11_premier_league(Start,End)), generate_facts_ev_1788_89_united_states_presidential_election_OR_ev_2010_11_premier_league(Tail).

ev_1788_89_united_states_presidential_election_OR_ev_2010_11_premier_league_aux() :- findall((Start,End),ev_1788_89_united_states_presidential_election(Start,End),Interval1), findall((Start,End),ev_2010_11_premier_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1788_89_united_states_presidential_election_OR_ev_2010_11_premier_league(Interval).

ev_1788_89_united_states_presidential_election_OR_ev_2010_11_premier_league_at_1950(Res) :- setof((Start,End),ev_1788_89_united_states_presidential_election_OR_ev_2010_11_premier_league(Start,End),AllINtervals), checkvalidity(1950,AllINtervals,Res).

check_query() :- write('Query = ev_1788_89_united_states_presidential_election_OR_ev_2010_11_premier_league_at_1950'), (ev_1788_89_united_states_presidential_election_OR_ev_2010_11_premier_league_at_1950(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1788_89_united_states_presidential_election_OR_ev_2010_11_premier_league_aux().

