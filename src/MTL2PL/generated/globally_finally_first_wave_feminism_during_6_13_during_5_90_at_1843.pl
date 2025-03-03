:- include('database.pl').
first_wave_feminism(Start,End) :- begin('first_wave_feminism',_,_,Start), end('first_wave_feminism',_,_,End), Start=<End.

finally_first_wave_feminism_during_6_13(Start,End) :- first_wave_feminism(Start1,End1), (Start1-13)=<(End1-6), Start is (Start1-13), End is (End1-6), Start=<End.

globally_finally_first_wave_feminism_during_6_13_during_5_90(Start,End) :- finally_first_wave_feminism_during_6_13(Start1,End1), Start is (Start1-5), End is (End1-90), Start=<End.

globally_finally_first_wave_feminism_during_6_13_during_5_90_at_1843(Res) :- setof((Start,End),globally_finally_first_wave_feminism_during_6_13_during_5_90(Start,End),AllINtervals), checkvalidity(1843,AllINtervals,Res).

check_query() :- write('Query = globally_finally_first_wave_feminism_during_6_13_during_5_90_at_1843'), (globally_finally_first_wave_feminism_during_6_13_during_5_90_at_1843(true) -> write('\nRes   = true');write('\nRes   = false')).

