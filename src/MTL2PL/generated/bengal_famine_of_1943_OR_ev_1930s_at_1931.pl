:- include('database.pl').
bengal_famine_of_1943(Start,End) :- begin('bengal_famine_of_1943',_,_,Start), end('bengal_famine_of_1943',_,_,End), Start=<End.

ev_1930s(Start,End) :- begin('ev_1930s',_,_,Start), end('ev_1930s',_,_,End), Start=<End.

generate_facts_bengal_famine_of_1943_OR_ev_1930s([]) :- assert(bengal_famine_of_1943_OR_ev_1930s(-1,-1)).

generate_facts_bengal_famine_of_1943_OR_ev_1930s([(Start,End) | Tail]) :- assert(bengal_famine_of_1943_OR_ev_1930s(Start,End)), generate_facts_bengal_famine_of_1943_OR_ev_1930s(Tail).

bengal_famine_of_1943_OR_ev_1930s_aux() :- findall((Start,End),bengal_famine_of_1943(Start,End),Interval1), findall((Start,End),ev_1930s(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_bengal_famine_of_1943_OR_ev_1930s(Interval).

bengal_famine_of_1943_OR_ev_1930s_at_1931(Res) :- setof((Start,End),bengal_famine_of_1943_OR_ev_1930s(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = bengal_famine_of_1943_OR_ev_1930s_at_1931'), (bengal_famine_of_1943_OR_ev_1930s_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bengal_famine_of_1943_OR_ev_1930s_aux().

