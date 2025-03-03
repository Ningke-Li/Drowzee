:- include('database.pl').
death_note(Start,End) :- begin('death_note',_,_,Start), end('death_note',_,_,End), Start=<End.

globally_death_note_during_1_3(Start,End) :- death_note(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_death_note_during_1_3_at_2002(Res) :- setof((Start,End),globally_death_note_during_1_3(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = globally_death_note_during_1_3_at_2002'), (globally_death_note_during_1_3_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

