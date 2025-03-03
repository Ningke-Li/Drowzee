:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

glee(Start,End) :- begin('glee',_,_,Start), end('glee',_,_,End), Start=<End.

samurai_jack_last_till_4_10(Start,End) :- samurai_jack(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

samurai_jack_until_glee_during_4_10_overlap(Start,End) :- samurai_jack_last_till_4_10(Start1,End1), glee(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

samurai_jack_until_glee_during_4_10(Start,End) :- samurai_jack(W1,_), samurai_jack_until_glee_during_4_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-4), Start=<End.

samurai_jack_until_glee_during_4_10_at_1995(Res) :- setof((Start,End),samurai_jack_until_glee_during_4_10(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = samurai_jack_until_glee_during_4_10_at_1995'), (samurai_jack_until_glee_during_4_10_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

