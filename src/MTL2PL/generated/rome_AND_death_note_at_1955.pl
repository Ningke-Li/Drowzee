:- include('database.pl').
rome(Start,End) :- begin('rome',_,_,Start), end('rome',_,_,End), Start=<End.

death_note(Start,End) :- begin('death_note',_,_,Start), end('death_note',_,_,End), Start=<End.

generate_facts_rome_AND_death_note([]) :- assert(rome_AND_death_note(-1,-1)).

generate_facts_rome_AND_death_note([(Start,End) | Tail]) :- assert(rome_AND_death_note(Start,End)), generate_facts_rome_AND_death_note(Tail).

rome_AND_death_note_aux() :- findall((Start,End),rome(Start,End),Interval1), findall((Start,End),death_note(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_rome_AND_death_note(Interval).

rome_AND_death_note_at_1955(Res) :- setof((Start,End),rome_AND_death_note(Start,End),AllINtervals), checkvalidity(1955,AllINtervals,Res).

check_query() :- write('Query = rome_AND_death_note_at_1955'), (rome_AND_death_note_at_1955(true) -> write('\nRes   = true');write('\nRes   = false')).
?- rome_AND_death_note_aux().

