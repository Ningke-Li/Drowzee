:- include('database.pl').
french_revolution(Start,End) :- begin('french_revolution',_,_,Start), end('french_revolution',_,_,End), Start=<End.

finally_french_revolution_during_2_15(Start,End) :- french_revolution(Start1,End1), (Start1-15)=<(End1-2), Start is (Start1-15), End is (End1-2), Start=<End.

next_finally_french_revolution_during_2_15(Start,End) :- finally_french_revolution_during_2_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_french_revolution_during_2_15_at_1767(Res) :- setof((Start,End),next_finally_french_revolution_during_2_15(Start,End),AllINtervals), checkvalidity(1767,AllINtervals,Res).

check_query() :- write('Query = next_finally_french_revolution_during_2_15_at_1767'), (next_finally_french_revolution_during_2_15_at_1767(true) -> write('\nRes   = true');write('\nRes   = false')).

