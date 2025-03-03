:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

finally_samurai_jack_during_3_18(Start,End) :- samurai_jack(Start1,End1), (Start1-18)=<(End1-3), Start is (Start1-18), End is (End1-3), Start=<End.

globally_finally_samurai_jack_during_3_18_during_8_13(Start,End) :- finally_samurai_jack_during_3_18(Start1,End1), Start is (Start1-8), End is (End1-13), Start=<End.

globally_finally_samurai_jack_during_3_18_during_8_13_at_1995(Res) :- setof((Start,End),globally_finally_samurai_jack_during_3_18_during_8_13(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = globally_finally_samurai_jack_during_3_18_during_8_13_at_1995'), (globally_finally_samurai_jack_during_3_18_during_8_13_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

