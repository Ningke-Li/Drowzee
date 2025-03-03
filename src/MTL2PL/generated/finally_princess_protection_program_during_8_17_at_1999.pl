:- include('database.pl').
princess_protection_program(Start,End) :- begin('princess_protection_program',_,_,Start), end('princess_protection_program',_,_,End), Start=<End.

finally_princess_protection_program_during_8_17(Start,End) :- princess_protection_program(Start1,End1), (Start1-17)=<(End1-8), Start is (Start1-17), End is (End1-8), Start=<End.

finally_princess_protection_program_during_8_17_at_1999(Res) :- setof((Start,End),finally_princess_protection_program_during_8_17(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = finally_princess_protection_program_during_8_17_at_1999'), (finally_princess_protection_program_during_8_17_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

