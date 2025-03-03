:- include('database.pl').
kulturkampf(Start,End) :- begin('kulturkampf',_,_,Start), end('kulturkampf',_,_,End), Start=<End.

next_kulturkampf(Start,End) :- kulturkampf(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_kulturkampf_at_1791(Res) :- setof((Start,End),next_kulturkampf(Start,End),AllINtervals), checkvalidity(1791,AllINtervals,Res).

check_query() :- write('Query = next_kulturkampf_at_1791'), (next_kulturkampf_at_1791(true) -> write('\nRes   = true');write('\nRes   = false')).

