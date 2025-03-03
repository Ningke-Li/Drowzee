:- include('database.pl').
new_girl(Start,End) :- begin('new_girl',_,_,Start), end('new_girl',_,_,End), Start=<End.

bojack_horseman(Start,End) :- begin('bojack_horseman',_,_,Start), end('bojack_horseman',_,_,End), Start=<End.

new_girl_last_till_2_4(Start,End) :- new_girl(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

new_girl_until_bojack_horseman_during_2_4_overlap(Start,End) :- new_girl_last_till_2_4(Start1,End1), bojack_horseman(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

new_girl_until_bojack_horseman_during_2_4(Start,End) :- new_girl(W1,_), new_girl_until_bojack_horseman_during_2_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-2), Start=<End.

new_girl_until_bojack_horseman_during_2_4_at_2005(Res) :- setof((Start,End),new_girl_until_bojack_horseman_during_2_4(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = new_girl_until_bojack_horseman_during_2_4_at_2005'), (new_girl_until_bojack_horseman_during_2_4_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

