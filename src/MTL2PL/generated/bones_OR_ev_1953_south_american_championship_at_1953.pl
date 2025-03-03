:- include('database.pl').
bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

ev_1953_south_american_championship(Start,End) :- begin('ev_1953_south_american_championship',_,_,Start), end('ev_1953_south_american_championship',_,_,End), Start=<End.

generate_facts_bones_OR_ev_1953_south_american_championship([]) :- assert(bones_OR_ev_1953_south_american_championship(-1,-1)).

generate_facts_bones_OR_ev_1953_south_american_championship([(Start,End) | Tail]) :- assert(bones_OR_ev_1953_south_american_championship(Start,End)), generate_facts_bones_OR_ev_1953_south_american_championship(Tail).

bones_OR_ev_1953_south_american_championship_aux() :- findall((Start,End),bones(Start,End),Interval1), findall((Start,End),ev_1953_south_american_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_bones_OR_ev_1953_south_american_championship(Interval).

bones_OR_ev_1953_south_american_championship_at_1953(Res) :- setof((Start,End),bones_OR_ev_1953_south_american_championship(Start,End),AllINtervals), checkvalidity(1953,AllINtervals,Res).

check_query() :- write('Query = bones_OR_ev_1953_south_american_championship_at_1953'), (bones_OR_ev_1953_south_american_championship_at_1953(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bones_OR_ev_1953_south_american_championship_aux().

