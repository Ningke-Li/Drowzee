:- include('database.pl').
fronde(Start,End) :- begin('fronde',_,_,Start), end('fronde',_,_,End), Start=<End.

next_fronde(Start,End) :- fronde(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_fronde_at_1687(Res) :- setof((Start,End),next_fronde(Start,End),AllINtervals), checkvalidity(1687,AllINtervals,Res).

check_query() :- write('Query = next_fronde_at_1687'), (next_fronde_at_1687(true) -> write('\nRes   = true');write('\nRes   = false')).

