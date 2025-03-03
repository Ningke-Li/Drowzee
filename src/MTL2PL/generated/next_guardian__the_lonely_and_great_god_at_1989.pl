:- include('database.pl').
guardian__the_lonely_and_great_god(Start,End) :- begin('guardian__the_lonely_and_great_god',_,_,Start), end('guardian__the_lonely_and_great_god',_,_,End), Start=<End.

next_guardian__the_lonely_and_great_god(Start,End) :- guardian__the_lonely_and_great_god(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_guardian__the_lonely_and_great_god_at_1989(Res) :- setof((Start,End),next_guardian__the_lonely_and_great_god(Start,End),AllINtervals), checkvalidity(1989,AllINtervals,Res).

check_query() :- write('Query = next_guardian__the_lonely_and_great_god_at_1989'), (next_guardian__the_lonely_and_great_god_at_1989(true) -> write('\nRes   = true');write('\nRes   = false')).

