:- include('database.pl').
ev_1935_south_american_championship(Start,End) :- begin('ev_1935_south_american_championship',_,_,Start), end('ev_1935_south_american_championship',_,_,End), Start=<End.

cavendish_experiment(Start,End) :- begin('cavendish_experiment',_,_,Start), end('cavendish_experiment',_,_,End), Start=<End.

generate_facts_ev_1935_south_american_championship_OR_cavendish_experiment([]) :- assert(ev_1935_south_american_championship_OR_cavendish_experiment(-1,-1)).

generate_facts_ev_1935_south_american_championship_OR_cavendish_experiment([(Start,End) | Tail]) :- assert(ev_1935_south_american_championship_OR_cavendish_experiment(Start,End)), generate_facts_ev_1935_south_american_championship_OR_cavendish_experiment(Tail).

ev_1935_south_american_championship_OR_cavendish_experiment_aux() :- findall((Start,End),ev_1935_south_american_championship(Start,End),Interval1), findall((Start,End),cavendish_experiment(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1935_south_american_championship_OR_cavendish_experiment(Interval).

ev_1935_south_american_championship_OR_cavendish_experiment_at_1817(Res) :- setof((Start,End),ev_1935_south_american_championship_OR_cavendish_experiment(Start,End),AllINtervals), checkvalidity(1817,AllINtervals,Res).

check_query() :- write('Query = ev_1935_south_american_championship_OR_cavendish_experiment_at_1817'), (ev_1935_south_american_championship_OR_cavendish_experiment_at_1817(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1935_south_american_championship_OR_cavendish_experiment_aux().

