:- include('database.pl').
gilded_age(Start,End) :- begin('gilded_age',_,_,Start), end('gilded_age',_,_,End), Start=<End.

next_gilded_age(Start,End) :- gilded_age(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_gilded_age_at_1884(Res) :- setof((Start,End),next_gilded_age(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = next_gilded_age_at_1884'), (next_gilded_age_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).

