:- include('database.pl').
convertible_peso(Start,End) :- begin('convertible_peso',_,_,Start), end('convertible_peso',_,_,End), Start=<End.

ben_10__ultimate_alien(Start,End) :- begin('ben_10__ultimate_alien',_,_,Start), end('ben_10__ultimate_alien',_,_,End), Start=<End.

convertible_peso_last_till_5_12(Start,End) :- convertible_peso(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

convertible_peso_until_ben_10__ultimate_alien_during_5_12_overlap(Start,End) :- convertible_peso_last_till_5_12(Start1,End1), ben_10__ultimate_alien(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

convertible_peso_until_ben_10__ultimate_alien_during_5_12(Start,End) :- convertible_peso(W1,_), convertible_peso_until_ben_10__ultimate_alien_during_5_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-5), Start=<End.

convertible_peso_until_ben_10__ultimate_alien_during_5_12_at_2005(Res) :- setof((Start,End),convertible_peso_until_ben_10__ultimate_alien_during_5_12(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = convertible_peso_until_ben_10__ultimate_alien_during_5_12_at_2005'), (convertible_peso_until_ben_10__ultimate_alien_during_5_12_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

