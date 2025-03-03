:- include('database.pl').
macedonian_front(Start,End) :- begin('macedonian_front',_,_,Start), end('macedonian_front',_,_,End), Start=<End.

finally_macedonian_front_during_8_15(Start,End) :- macedonian_front(Start1,End1), (Start1-15)=<(End1-8), Start is (Start1-15), End is (End1-8), Start=<End.

next_finally_macedonian_front_during_8_15(Start,End) :- finally_macedonian_front_during_8_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_macedonian_front_during_8_15_at_1906(Res) :- setof((Start,End),next_finally_macedonian_front_during_8_15(Start,End),AllINtervals), checkvalidity(1906,AllINtervals,Res).

check_query() :- write('Query = next_finally_macedonian_front_during_8_15_at_1906'), (next_finally_macedonian_front_during_8_15_at_1906(true) -> write('\nRes   = true');write('\nRes   = false')).

