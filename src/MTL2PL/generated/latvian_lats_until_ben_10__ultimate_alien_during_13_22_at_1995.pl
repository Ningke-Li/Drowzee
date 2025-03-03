:- include('database.pl').
latvian_lats(Start,End) :- begin('latvian_lats',_,_,Start), end('latvian_lats',_,_,End), Start=<End.

ben_10__ultimate_alien(Start,End) :- begin('ben_10__ultimate_alien',_,_,Start), end('ben_10__ultimate_alien',_,_,End), Start=<End.

latvian_lats_last_till_13_22(Start,End) :- latvian_lats(Start1,End1), (End1-Start1)>=13, Start is (Start1+13), End is (End1+1).

latvian_lats_until_ben_10__ultimate_alien_during_13_22_overlap(Start,End) :- latvian_lats_last_till_13_22(Start1,End1), ben_10__ultimate_alien(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

latvian_lats_until_ben_10__ultimate_alien_during_13_22(Start,End) :- latvian_lats(W1,_), latvian_lats_until_ben_10__ultimate_alien_during_13_22_overlap(Start1,End1), Start is max((Start1-22),W1), End is (End1-13), Start=<End.

latvian_lats_until_ben_10__ultimate_alien_during_13_22_at_1995(Res) :- setof((Start,End),latvian_lats_until_ben_10__ultimate_alien_during_13_22(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = latvian_lats_until_ben_10__ultimate_alien_during_13_22_at_1995'), (latvian_lats_until_ben_10__ultimate_alien_during_13_22_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

