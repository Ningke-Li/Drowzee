:- include('database.pl').
peanuts(Start,End) :- begin('peanuts',_,_,Start), end('peanuts',_,_,End), Start=<End.

next_peanuts(Start,End) :- peanuts(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_peanuts_at_1966(Res) :- setof((Start,End),next_peanuts(Start,End),AllINtervals), checkvalidity(1966,AllINtervals,Res).

check_query() :- write('Query = next_peanuts_at_1966'), (next_peanuts_at_1966(true) -> write('\nRes   = true');write('\nRes   = false')).

