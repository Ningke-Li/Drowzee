:- include('database.pl').
baby_boomers(Start,End) :- begin('baby_boomers',_,_,Start), end('baby_boomers',_,_,End), Start=<End.

next_baby_boomers(Start,End) :- baby_boomers(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_baby_boomers_at_1948(Res) :- setof((Start,End),next_baby_boomers(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = next_baby_boomers_at_1948'), (next_baby_boomers_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).

