:- include('database.pl').
french_resistance(Start,End) :- begin('french_resistance',_,_,Start), end('french_resistance',_,_,End), Start=<End.

next_french_resistance(Start,End) :- french_resistance(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_french_resistance_at_1921(Res) :- setof((Start,End),next_french_resistance(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = next_french_resistance_at_1921'), (next_french_resistance_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).

