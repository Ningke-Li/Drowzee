:- include('database.pl').
death_note(Start,End) :- begin('death_note',_,_,Start), end('death_note',_,_,End), Start=<End.

next_death_note(Start,End) :- death_note(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_death_note_at_2005(Res) :- setof((Start,End),next_death_note(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = next_death_note_at_2005'), (next_death_note_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

