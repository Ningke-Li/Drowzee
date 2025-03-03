:- include('database.pl').
fullmetal_alchemist(Start,End) :- begin('fullmetal_alchemist',_,_,Start), end('fullmetal_alchemist',_,_,End), Start=<End.

ev_2004_05_la_liga(Start,End) :- begin('ev_2004_05_la_liga',_,_,Start), end('ev_2004_05_la_liga',_,_,End), Start=<End.

generate_facts_fullmetal_alchemist_AND_ev_2004_05_la_liga([]) :- assert(fullmetal_alchemist_AND_ev_2004_05_la_liga(-1,-1)).

generate_facts_fullmetal_alchemist_AND_ev_2004_05_la_liga([(Start,End) | Tail]) :- assert(fullmetal_alchemist_AND_ev_2004_05_la_liga(Start,End)), generate_facts_fullmetal_alchemist_AND_ev_2004_05_la_liga(Tail).

fullmetal_alchemist_AND_ev_2004_05_la_liga_aux() :- findall((Start,End),fullmetal_alchemist(Start,End),Interval1), findall((Start,End),ev_2004_05_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_fullmetal_alchemist_AND_ev_2004_05_la_liga(Interval).

fullmetal_alchemist_AND_ev_2004_05_la_liga_at_2004(Res) :- setof((Start,End),fullmetal_alchemist_AND_ev_2004_05_la_liga(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = fullmetal_alchemist_AND_ev_2004_05_la_liga_at_2004'), (fullmetal_alchemist_AND_ev_2004_05_la_liga_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- fullmetal_alchemist_AND_ev_2004_05_la_liga_aux().

