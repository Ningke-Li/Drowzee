:- include('database.pl').
the_fairly_oddparents(Start,End) :- begin('the_fairly_oddparents',_,_,Start), end('the_fairly_oddparents',_,_,End), Start=<End.

heroes(Start,End) :- begin('heroes',_,_,Start), end('heroes',_,_,End), Start=<End.

the_fairly_oddparents_last_till_3_8(Start,End) :- the_fairly_oddparents(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

the_fairly_oddparents_until_heroes_during_3_8_overlap(Start,End) :- the_fairly_oddparents_last_till_3_8(Start1,End1), heroes(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_fairly_oddparents_until_heroes_during_3_8(Start,End) :- the_fairly_oddparents(W1,_), the_fairly_oddparents_until_heroes_during_3_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-3), Start=<End.

the_fairly_oddparents_until_heroes_during_3_8_at_2012(Res) :- setof((Start,End),the_fairly_oddparents_until_heroes_during_3_8(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = the_fairly_oddparents_until_heroes_during_3_8_at_2012'), (the_fairly_oddparents_until_heroes_during_3_8_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

