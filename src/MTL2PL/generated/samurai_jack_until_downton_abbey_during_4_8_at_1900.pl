:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

downton_abbey(Start,End) :- begin('downton_abbey',_,_,Start), end('downton_abbey',_,_,End), Start=<End.

samurai_jack_last_till_4_8(Start,End) :- samurai_jack(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

samurai_jack_until_downton_abbey_during_4_8_overlap(Start,End) :- samurai_jack_last_till_4_8(Start1,End1), downton_abbey(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

samurai_jack_until_downton_abbey_during_4_8(Start,End) :- samurai_jack(W1,_), samurai_jack_until_downton_abbey_during_4_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-4), Start=<End.

samurai_jack_until_downton_abbey_during_4_8_at_1900(Res) :- setof((Start,End),samurai_jack_until_downton_abbey_during_4_8(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = samurai_jack_until_downton_abbey_during_4_8_at_1900'), (samurai_jack_until_downton_abbey_during_4_8_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).

