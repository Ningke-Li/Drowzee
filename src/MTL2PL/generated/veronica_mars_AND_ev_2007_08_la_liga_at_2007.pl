:- include('database.pl').
veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

ev_2007_08_la_liga(Start,End) :- begin('ev_2007_08_la_liga',_,_,Start), end('ev_2007_08_la_liga',_,_,End), Start=<End.

generate_facts_veronica_mars_AND_ev_2007_08_la_liga([]) :- assert(veronica_mars_AND_ev_2007_08_la_liga(-1,-1)).

generate_facts_veronica_mars_AND_ev_2007_08_la_liga([(Start,End) | Tail]) :- assert(veronica_mars_AND_ev_2007_08_la_liga(Start,End)), generate_facts_veronica_mars_AND_ev_2007_08_la_liga(Tail).

veronica_mars_AND_ev_2007_08_la_liga_aux() :- findall((Start,End),veronica_mars(Start,End),Interval1), findall((Start,End),ev_2007_08_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_veronica_mars_AND_ev_2007_08_la_liga(Interval).

veronica_mars_AND_ev_2007_08_la_liga_at_2007(Res) :- setof((Start,End),veronica_mars_AND_ev_2007_08_la_liga(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = veronica_mars_AND_ev_2007_08_la_liga_at_2007'), (veronica_mars_AND_ev_2007_08_la_liga_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- veronica_mars_AND_ev_2007_08_la_liga_aux().

