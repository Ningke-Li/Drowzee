:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

dr__romantic(Start,End) :- begin('dr__romantic',_,_,Start), end('dr__romantic',_,_,End), Start=<End.

samurai_jack_last_till_7_16(Start,End) :- samurai_jack(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

samurai_jack_until_dr__romantic_during_7_16_overlap(Start,End) :- samurai_jack_last_till_7_16(Start1,End1), dr__romantic(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

samurai_jack_until_dr__romantic_during_7_16(Start,End) :- samurai_jack(W1,_), samurai_jack_until_dr__romantic_during_7_16_overlap(Start1,End1), Start is max((Start1-16),W1), End is (End1-7), Start=<End.

samurai_jack_until_dr__romantic_during_7_16_at_1913(Res) :- setof((Start,End),samurai_jack_until_dr__romantic_during_7_16(Start,End),AllINtervals), checkvalidity(1913,AllINtervals,Res).

check_query() :- write('Query = samurai_jack_until_dr__romantic_during_7_16_at_1913'), (samurai_jack_until_dr__romantic_during_7_16_at_1913(true) -> write('\nRes   = true');write('\nRes   = false')).

