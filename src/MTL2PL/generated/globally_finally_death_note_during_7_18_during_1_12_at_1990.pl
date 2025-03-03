:- include('database.pl').
death_note(Start,End) :- begin('death_note',_,_,Start), end('death_note',_,_,End), Start=<End.

finally_death_note_during_7_18(Start,End) :- death_note(Start1,End1), (Start1-18)=<(End1-7), Start is (Start1-18), End is (End1-7), Start=<End.

globally_finally_death_note_during_7_18_during_1_12(Start,End) :- finally_death_note_during_7_18(Start1,End1), Start is (Start1-1), End is (End1-12), Start=<End.

globally_finally_death_note_during_7_18_during_1_12_at_1990(Res) :- setof((Start,End),globally_finally_death_note_during_7_18_during_1_12(Start,End),AllINtervals), checkvalidity(1990,AllINtervals,Res).

check_query() :- write('Query = globally_finally_death_note_during_7_18_during_1_12_at_1990'), (globally_finally_death_note_during_7_18_during_1_12_at_1990(true) -> write('\nRes   = true');write('\nRes   = false')).

