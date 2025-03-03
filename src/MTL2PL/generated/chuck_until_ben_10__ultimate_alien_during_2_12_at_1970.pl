:- include('database.pl').
chuck(Start,End) :- begin('chuck',_,_,Start), end('chuck',_,_,End), Start=<End.

ben_10__ultimate_alien(Start,End) :- begin('ben_10__ultimate_alien',_,_,Start), end('ben_10__ultimate_alien',_,_,End), Start=<End.

chuck_last_till_2_12(Start,End) :- chuck(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

chuck_until_ben_10__ultimate_alien_during_2_12_overlap(Start,End) :- chuck_last_till_2_12(Start1,End1), ben_10__ultimate_alien(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

chuck_until_ben_10__ultimate_alien_during_2_12(Start,End) :- chuck(W1,_), chuck_until_ben_10__ultimate_alien_during_2_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-2), Start=<End.

chuck_until_ben_10__ultimate_alien_during_2_12_at_1970(Res) :- setof((Start,End),chuck_until_ben_10__ultimate_alien_during_2_12(Start,End),AllINtervals), checkvalidity(1970,AllINtervals,Res).

check_query() :- write('Query = chuck_until_ben_10__ultimate_alien_during_2_12_at_1970'), (chuck_until_ben_10__ultimate_alien_during_2_12_at_1970(true) -> write('\nRes   = true');write('\nRes   = false')).

