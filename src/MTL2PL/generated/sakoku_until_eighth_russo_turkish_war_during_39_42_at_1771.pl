:- include('database.pl').
sakoku(Start,End) :- begin('sakoku',_,_,Start), end('sakoku',_,_,End), Start=<End.

eighth_russo_turkish_war(Start,End) :- begin('eighth_russo_turkish_war',_,_,Start), end('eighth_russo_turkish_war',_,_,End), Start=<End.

sakoku_last_till_39_42(Start,End) :- sakoku(Start1,End1), (End1-Start1)>=39, Start is (Start1+39), End is (End1+1).

sakoku_until_eighth_russo_turkish_war_during_39_42_overlap(Start,End) :- sakoku_last_till_39_42(Start1,End1), eighth_russo_turkish_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

sakoku_until_eighth_russo_turkish_war_during_39_42(Start,End) :- sakoku(W1,_), sakoku_until_eighth_russo_turkish_war_during_39_42_overlap(Start1,End1), Start is max((Start1-42),W1), End is (End1-39), Start=<End.

sakoku_until_eighth_russo_turkish_war_during_39_42_at_1771(Res) :- setof((Start,End),sakoku_until_eighth_russo_turkish_war_during_39_42(Start,End),AllINtervals), checkvalidity(1771,AllINtervals,Res).

check_query() :- write('Query = sakoku_until_eighth_russo_turkish_war_during_39_42_at_1771'), (sakoku_until_eighth_russo_turkish_war_during_39_42_at_1771(true) -> write('\nRes   = true');write('\nRes   = false')).

