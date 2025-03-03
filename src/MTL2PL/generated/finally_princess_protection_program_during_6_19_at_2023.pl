:- include('database.pl').
princess_protection_program(Start,End) :- begin('princess_protection_program',_,_,Start), end('princess_protection_program',_,_,End), Start=<End.

finally_princess_protection_program_during_6_19(Start,End) :- princess_protection_program(Start1,End1), (Start1-19)=<(End1-6), Start is (Start1-19), End is (End1-6), Start=<End.

finally_princess_protection_program_during_6_19_at_2023(Res) :- setof((Start,End),finally_princess_protection_program_during_6_19(Start,End),AllINtervals), checkvalidity(2023,AllINtervals,Res).

check_query() :- write('Query = finally_princess_protection_program_during_6_19_at_2023'), (finally_princess_protection_program_during_6_19_at_2023(true) -> write('\nRes   = true');write('\nRes   = false')).

