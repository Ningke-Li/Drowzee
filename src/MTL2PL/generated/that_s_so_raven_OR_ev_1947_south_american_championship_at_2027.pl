:- include('database.pl').
that_s_so_raven(Start,End) :- begin('that_s_so_raven',_,_,Start), end('that_s_so_raven',_,_,End), Start=<End.

ev_1947_south_american_championship(Start,End) :- begin('ev_1947_south_american_championship',_,_,Start), end('ev_1947_south_american_championship',_,_,End), Start=<End.

generate_facts_that_s_so_raven_OR_ev_1947_south_american_championship([]) :- assert(that_s_so_raven_OR_ev_1947_south_american_championship(-1,-1)).

generate_facts_that_s_so_raven_OR_ev_1947_south_american_championship([(Start,End) | Tail]) :- assert(that_s_so_raven_OR_ev_1947_south_american_championship(Start,End)), generate_facts_that_s_so_raven_OR_ev_1947_south_american_championship(Tail).

that_s_so_raven_OR_ev_1947_south_american_championship_aux() :- findall((Start,End),that_s_so_raven(Start,End),Interval1), findall((Start,End),ev_1947_south_american_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_that_s_so_raven_OR_ev_1947_south_american_championship(Interval).

that_s_so_raven_OR_ev_1947_south_american_championship_at_2027(Res) :- setof((Start,End),that_s_so_raven_OR_ev_1947_south_american_championship(Start,End),AllINtervals), checkvalidity(2027,AllINtervals,Res).

check_query() :- write('Query = that_s_so_raven_OR_ev_1947_south_american_championship_at_2027'), (that_s_so_raven_OR_ev_1947_south_american_championship_at_2027(true) -> write('\nRes   = true');write('\nRes   = false')).
?- that_s_so_raven_OR_ev_1947_south_american_championship_aux().

