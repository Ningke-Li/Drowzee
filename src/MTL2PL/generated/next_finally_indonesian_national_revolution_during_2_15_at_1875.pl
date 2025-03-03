:- include('database.pl').
indonesian_national_revolution(Start,End) :- begin('indonesian_national_revolution',_,_,Start), end('indonesian_national_revolution',_,_,End), Start=<End.

finally_indonesian_national_revolution_during_2_15(Start,End) :- indonesian_national_revolution(Start1,End1), (Start1-15)=<(End1-2), Start is (Start1-15), End is (End1-2), Start=<End.

next_finally_indonesian_national_revolution_during_2_15(Start,End) :- finally_indonesian_national_revolution_during_2_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_indonesian_national_revolution_during_2_15_at_1875(Res) :- setof((Start,End),next_finally_indonesian_national_revolution_during_2_15(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = next_finally_indonesian_national_revolution_during_2_15_at_1875'), (next_finally_indonesian_national_revolution_during_2_15_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).

