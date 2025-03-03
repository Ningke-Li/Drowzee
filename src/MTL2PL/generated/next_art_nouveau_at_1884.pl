:- include('database.pl').
art_nouveau(Start,End) :- begin('art_nouveau',_,_,Start), end('art_nouveau',_,_,End), Start=<End.

next_art_nouveau(Start,End) :- art_nouveau(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_art_nouveau_at_1884(Res) :- setof((Start,End),next_art_nouveau(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = next_art_nouveau_at_1884'), (next_art_nouveau_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).

