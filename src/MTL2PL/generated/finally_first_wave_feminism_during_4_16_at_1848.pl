:- include('database.pl').
first_wave_feminism(Start,End) :- begin('first_wave_feminism',_,_,Start), end('first_wave_feminism',_,_,End), Start=<End.

finally_first_wave_feminism_during_4_16(Start,End) :- first_wave_feminism(Start1,End1), (Start1-16)=<(End1-4), Start is (Start1-16), End is (End1-4), Start=<End.

finally_first_wave_feminism_during_4_16_at_1848(Res) :- setof((Start,End),finally_first_wave_feminism_during_4_16(Start,End),AllINtervals), checkvalidity(1848,AllINtervals,Res).

check_query() :- write('Query = finally_first_wave_feminism_during_4_16_at_1848'), (finally_first_wave_feminism_during_4_16_at_1848(true) -> write('\nRes   = true');write('\nRes   = false')).

