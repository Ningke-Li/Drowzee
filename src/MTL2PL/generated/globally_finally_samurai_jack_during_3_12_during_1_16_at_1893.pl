:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

finally_samurai_jack_during_3_12(Start,End) :- samurai_jack(Start1,End1), (Start1-12)=<(End1-3), Start is (Start1-12), End is (End1-3), Start=<End.

globally_finally_samurai_jack_during_3_12_during_1_16(Start,End) :- finally_samurai_jack_during_3_12(Start1,End1), Start is (Start1-1), End is (End1-16), Start=<End.

globally_finally_samurai_jack_during_3_12_during_1_16_at_1893(Res) :- setof((Start,End),globally_finally_samurai_jack_during_3_12_during_1_16(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = globally_finally_samurai_jack_during_3_12_during_1_16_at_1893'), (globally_finally_samurai_jack_during_3_12_during_1_16_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).

