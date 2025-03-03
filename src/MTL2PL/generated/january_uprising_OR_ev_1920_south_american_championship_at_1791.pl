:- include('database.pl').
january_uprising(Start,End) :- begin('january_uprising',_,_,Start), end('january_uprising',_,_,End), Start=<End.

ev_1920_south_american_championship(Start,End) :- begin('ev_1920_south_american_championship',_,_,Start), end('ev_1920_south_american_championship',_,_,End), Start=<End.

generate_facts_january_uprising_OR_ev_1920_south_american_championship([]) :- assert(january_uprising_OR_ev_1920_south_american_championship(-1,-1)).

generate_facts_january_uprising_OR_ev_1920_south_american_championship([(Start,End) | Tail]) :- assert(january_uprising_OR_ev_1920_south_american_championship(Start,End)), generate_facts_january_uprising_OR_ev_1920_south_american_championship(Tail).

january_uprising_OR_ev_1920_south_american_championship_aux() :- findall((Start,End),january_uprising(Start,End),Interval1), findall((Start,End),ev_1920_south_american_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_january_uprising_OR_ev_1920_south_american_championship(Interval).

january_uprising_OR_ev_1920_south_american_championship_at_1791(Res) :- setof((Start,End),january_uprising_OR_ev_1920_south_american_championship(Start,End),AllINtervals), checkvalidity(1791,AllINtervals,Res).

check_query() :- write('Query = january_uprising_OR_ev_1920_south_american_championship_at_1791'), (january_uprising_OR_ev_1920_south_american_championship_at_1791(true) -> write('\nRes   = true');write('\nRes   = false')).
?- january_uprising_OR_ev_1920_south_american_championship_aux().

