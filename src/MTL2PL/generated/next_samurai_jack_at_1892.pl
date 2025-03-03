:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

next_samurai_jack(Start,End) :- samurai_jack(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_samurai_jack_at_1892(Res) :- setof((Start,End),next_samurai_jack(Start,End),AllINtervals), checkvalidity(1892,AllINtervals,Res).

check_query() :- write('Query = next_samurai_jack_at_1892'), (next_samurai_jack_at_1892(true) -> write('\nRes   = true');write('\nRes   = false')).

