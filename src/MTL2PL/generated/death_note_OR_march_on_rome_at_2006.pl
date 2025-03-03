:- include('database.pl').
death_note(Start,End) :- begin('death_note',_,_,Start), end('death_note',_,_,End), Start=<End.

march_on_rome(Start,End) :- begin('march_on_rome',_,_,Start), end('march_on_rome',_,_,End), Start=<End.

generate_facts_death_note_OR_march_on_rome([]) :- assert(death_note_OR_march_on_rome(-1,-1)).

generate_facts_death_note_OR_march_on_rome([(Start,End) | Tail]) :- assert(death_note_OR_march_on_rome(Start,End)), generate_facts_death_note_OR_march_on_rome(Tail).

death_note_OR_march_on_rome_aux() :- findall((Start,End),death_note(Start,End),Interval1), findall((Start,End),march_on_rome(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_death_note_OR_march_on_rome(Interval).

death_note_OR_march_on_rome_at_2006(Res) :- setof((Start,End),death_note_OR_march_on_rome(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = death_note_OR_march_on_rome_at_2006'), (death_note_OR_march_on_rome_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).
?- death_note_OR_march_on_rome_aux().

