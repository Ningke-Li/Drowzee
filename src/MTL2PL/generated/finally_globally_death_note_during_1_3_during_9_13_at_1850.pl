:- include('database.pl').
death_note(Start,End) :- begin('death_note',_,_,Start), end('death_note',_,_,End), Start=<End.

globally_death_note_during_1_3(Start,End) :- death_note(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

finally_globally_death_note_during_1_3_during_9_13(Start,End) :- globally_death_note_during_1_3(Start1,End1), (Start1-13)=<(End1-9), Start is (Start1-13), End is (End1-9), Start=<End.

finally_globally_death_note_during_1_3_during_9_13_at_1850(Res) :- setof((Start,End),finally_globally_death_note_during_1_3_during_9_13(Start,End),AllINtervals), checkvalidity(1850,AllINtervals,Res).

check_query() :- write('Query = finally_globally_death_note_during_1_3_during_9_13_at_1850'), (finally_globally_death_note_during_1_3_during_9_13_at_1850(true) -> write('\nRes   = true');write('\nRes   = false')).

