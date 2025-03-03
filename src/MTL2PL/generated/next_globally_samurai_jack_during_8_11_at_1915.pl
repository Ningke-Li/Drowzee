:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

globally_samurai_jack_during_8_11(Start,End) :- samurai_jack(Start1,End1), Start is (Start1-8), End is (End1-11), Start=<End.

next_globally_samurai_jack_during_8_11(Start,End) :- globally_samurai_jack_during_8_11(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_samurai_jack_during_8_11_at_1915(Res) :- setof((Start,End),next_globally_samurai_jack_during_8_11(Start,End),AllINtervals), checkvalidity(1915,AllINtervals,Res).

check_query() :- write('Query = next_globally_samurai_jack_during_8_11_at_1915'), (next_globally_samurai_jack_during_8_11_at_1915(true) -> write('\nRes   = true');write('\nRes   = false')).

