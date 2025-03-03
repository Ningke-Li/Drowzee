:- include('database.pl').
ranger_program(Start,End) :- begin('ranger_program',_,_,Start), end('ranger_program',_,_,End), Start=<End.

finally_ranger_program_during_7_15(Start,End) :- ranger_program(Start1,End1), (Start1-15)=<(End1-7), Start is (Start1-15), End is (End1-7), Start=<End.

finally_ranger_program_during_7_15_at_1954(Res) :- setof((Start,End),finally_ranger_program_during_7_15(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = finally_ranger_program_during_7_15_at_1954'), (finally_ranger_program_during_7_15_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).

