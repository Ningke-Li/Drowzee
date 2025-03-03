:- include('database.pl').
french_revolutionary_wars(Start,End) :- begin('french_revolutionary_wars',_,_,Start), end('french_revolutionary_wars',_,_,End), Start=<End.

next_french_revolutionary_wars(Start,End) :- french_revolutionary_wars(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_french_revolutionary_wars_at_1799(Res) :- setof((Start,End),next_french_revolutionary_wars(Start,End),AllINtervals), checkvalidity(1799,AllINtervals,Res).

check_query() :- write('Query = next_french_revolutionary_wars_at_1799'), (next_french_revolutionary_wars_at_1799(true) -> write('\nRes   = true');write('\nRes   = false')).

