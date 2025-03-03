:- include('database.pl').
nazism(Start,End) :- begin('nazism',_,_,Start), end('nazism',_,_,End), Start=<End.

next_nazism(Start,End) :- nazism(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_nazism_at_1908(Res) :- setof((Start,End),next_nazism(Start,End),AllINtervals), checkvalidity(1908,AllINtervals,Res).

check_query() :- write('Query = next_nazism_at_1908'), (next_nazism_at_1908(true) -> write('\nRes   = true');write('\nRes   = false')).

