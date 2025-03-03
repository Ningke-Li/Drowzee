:- include('database.pl').
sonny_with_a_chance(Start,End) :- begin('sonny_with_a_chance',_,_,Start), end('sonny_with_a_chance',_,_,End), Start=<End.

next_sonny_with_a_chance(Start,End) :- sonny_with_a_chance(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_sonny_with_a_chance_at_1891(Res) :- setof((Start,End),next_sonny_with_a_chance(Start,End),AllINtervals), checkvalidity(1891,AllINtervals,Res).

check_query() :- write('Query = next_sonny_with_a_chance_at_1891'), (next_sonny_with_a_chance_at_1891(true) -> write('\nRes   = true');write('\nRes   = false')).

