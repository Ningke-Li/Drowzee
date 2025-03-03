:- include('database.pl').
the_fairly_oddparents(Start,End) :- begin('the_fairly_oddparents',_,_,Start), end('the_fairly_oddparents',_,_,End), Start=<End.

globally_the_fairly_oddparents_during_2_16(Start,End) :- the_fairly_oddparents(Start1,End1), Start is (Start1-2), End is (End1-16), Start=<End.

globally_the_fairly_oddparents_during_2_16_at_2015(Res) :- setof((Start,End),globally_the_fairly_oddparents_during_2_16(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = globally_the_fairly_oddparents_during_2_16_at_2015'), (globally_the_fairly_oddparents_during_2_16_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

