:- include('database.pl').
death_note(Start,End) :- begin('death_note',_,_,Start), end('death_note',_,_,End), Start=<End.

globally_death_note_during_2_3(Start,End) :- death_note(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

globally_death_note_during_2_3_at_1891(Res) :- setof((Start,End),globally_death_note_during_2_3(Start,End),AllINtervals), checkvalidity(1891,AllINtervals,Res).

check_query() :- write('Query = globally_death_note_during_2_3_at_1891'), (globally_death_note_during_2_3_at_1891(true) -> write('\nRes   = true');write('\nRes   = false')).

