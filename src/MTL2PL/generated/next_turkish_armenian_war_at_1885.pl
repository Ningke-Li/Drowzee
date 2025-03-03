:- include('database.pl').
turkish_armenian_war(Start,End) :- begin('turkish_armenian_war',_,_,Start), end('turkish_armenian_war',_,_,End), Start=<End.

next_turkish_armenian_war(Start,End) :- turkish_armenian_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_turkish_armenian_war_at_1885(Res) :- setof((Start,End),next_turkish_armenian_war(Start,End),AllINtervals), checkvalidity(1885,AllINtervals,Res).

check_query() :- write('Query = next_turkish_armenian_war_at_1885'), (next_turkish_armenian_war_at_1885(true) -> write('\nRes   = true');write('\nRes   = false')).

