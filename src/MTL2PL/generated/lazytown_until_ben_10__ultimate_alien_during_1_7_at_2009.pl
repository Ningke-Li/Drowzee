:- include('database.pl').
lazytown(Start,End) :- begin('lazytown',_,_,Start), end('lazytown',_,_,End), Start=<End.

ben_10__ultimate_alien(Start,End) :- begin('ben_10__ultimate_alien',_,_,Start), end('ben_10__ultimate_alien',_,_,End), Start=<End.

lazytown_last_till_1_7(Start,End) :- lazytown(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

lazytown_until_ben_10__ultimate_alien_during_1_7_overlap(Start,End) :- lazytown_last_till_1_7(Start1,End1), ben_10__ultimate_alien(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

lazytown_until_ben_10__ultimate_alien_during_1_7(Start,End) :- lazytown(W1,_), lazytown_until_ben_10__ultimate_alien_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

lazytown_until_ben_10__ultimate_alien_during_1_7_at_2009(Res) :- setof((Start,End),lazytown_until_ben_10__ultimate_alien_during_1_7(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = lazytown_until_ben_10__ultimate_alien_during_1_7_at_2009'), (lazytown_until_ben_10__ultimate_alien_during_1_7_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

