:- include('database.pl').
death_note(Start,End) :- begin('death_note',_,_,Start), end('death_note',_,_,End), Start=<End.

ev_2016_17_la_liga(Start,End) :- begin('ev_2016_17_la_liga',_,_,Start), end('ev_2016_17_la_liga',_,_,End), Start=<End.

generate_facts_death_note_OR_ev_2016_17_la_liga([]) :- assert(death_note_OR_ev_2016_17_la_liga(-1,-1)).

generate_facts_death_note_OR_ev_2016_17_la_liga([(Start,End) | Tail]) :- assert(death_note_OR_ev_2016_17_la_liga(Start,End)), generate_facts_death_note_OR_ev_2016_17_la_liga(Tail).

death_note_OR_ev_2016_17_la_liga_aux() :- findall((Start,End),death_note(Start,End),Interval1), findall((Start,End),ev_2016_17_la_liga(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_death_note_OR_ev_2016_17_la_liga(Interval).

death_note_OR_ev_2016_17_la_liga_at_2036(Res) :- setof((Start,End),death_note_OR_ev_2016_17_la_liga(Start,End),AllINtervals), checkvalidity(2036,AllINtervals,Res).

check_query() :- write('Query = death_note_OR_ev_2016_17_la_liga_at_2036'), (death_note_OR_ev_2016_17_la_liga_at_2036(true) -> write('\nRes   = true');write('\nRes   = false')).
?- death_note_OR_ev_2016_17_la_liga_aux().

