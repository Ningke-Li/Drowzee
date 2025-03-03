:- include('database.pl').
star_wars_rebels(Start,End) :- begin('star_wars_rebels',_,_,Start), end('star_wars_rebels',_,_,End), Start=<End.

next_star_wars_rebels(Start,End) :- star_wars_rebels(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_star_wars_rebels_at_2007(Res) :- setof((Start,End),next_star_wars_rebels(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = next_star_wars_rebels_at_2007'), (next_star_wars_rebels_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

