:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

the_lion_guard(Start,End) :- begin('the_lion_guard',_,_,Start), end('the_lion_guard',_,_,End), Start=<End.

samurai_jack_last_till_2_4(Start,End) :- samurai_jack(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

samurai_jack_until_the_lion_guard_during_2_4_overlap(Start,End) :- samurai_jack_last_till_2_4(Start1,End1), the_lion_guard(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

samurai_jack_until_the_lion_guard_during_2_4(Start,End) :- samurai_jack(W1,_), samurai_jack_until_the_lion_guard_during_2_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-2), Start=<End.

samurai_jack_until_the_lion_guard_during_2_4_at_2028(Res) :- setof((Start,End),samurai_jack_until_the_lion_guard_during_2_4(Start,End),AllINtervals), checkvalidity(2028,AllINtervals,Res).

check_query() :- write('Query = samurai_jack_until_the_lion_guard_during_2_4_at_2028'), (samurai_jack_until_the_lion_guard_during_2_4_at_2028(true) -> write('\nRes   = true');write('\nRes   = false')).

