:- include('database.pl').
kyrgyz_revolution_of_2010(Start,End) :- begin('kyrgyz_revolution_of_2010',_,_,Start), end('kyrgyz_revolution_of_2010',_,_,End), Start=<End.

next_kyrgyz_revolution_of_2010(Start,End) :- kyrgyz_revolution_of_2010(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_kyrgyz_revolution_of_2010_at_1867(Res) :- setof((Start,End),next_kyrgyz_revolution_of_2010(Start,End),AllINtervals), checkvalidity(1867,AllINtervals,Res).

check_query() :- write('Query = next_kyrgyz_revolution_of_2010_at_1867'), (next_kyrgyz_revolution_of_2010_at_1867(true) -> write('\nRes   = true');write('\nRes   = false')).

