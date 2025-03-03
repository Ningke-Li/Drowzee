:- include('database.pl').
ranger_program(Start,End) :- begin('ranger_program',_,_,Start), end('ranger_program',_,_,End), Start=<End.

globally_ranger_program_during_1_6(Start,End) :- ranger_program(Start1,End1), Start is (Start1-1), End is (End1-6), Start=<End.

globally_ranger_program_during_1_6_at_2007(Res) :- setof((Start,End),globally_ranger_program_during_1_6(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = globally_ranger_program_during_1_6_at_2007'), (globally_ranger_program_during_1_6_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

