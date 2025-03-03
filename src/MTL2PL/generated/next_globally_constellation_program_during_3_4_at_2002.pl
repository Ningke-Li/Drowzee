:- include('database.pl').
constellation_program(Start,End) :- begin('constellation_program',_,_,Start), end('constellation_program',_,_,End), Start=<End.

globally_constellation_program_during_3_4(Start,End) :- constellation_program(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

next_globally_constellation_program_during_3_4(Start,End) :- globally_constellation_program_during_3_4(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_constellation_program_during_3_4_at_2002(Res) :- setof((Start,End),next_globally_constellation_program_during_3_4(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = next_globally_constellation_program_during_3_4_at_2002'), (next_globally_constellation_program_during_3_4_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

