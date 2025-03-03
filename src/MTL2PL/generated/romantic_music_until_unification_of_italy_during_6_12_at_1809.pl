:- include('database.pl').
romantic_music(Start,End) :- begin('romantic_music',_,_,Start), end('romantic_music',_,_,End), Start=<End.

unification_of_italy(Start,End) :- begin('unification_of_italy',_,_,Start), end('unification_of_italy',_,_,End), Start=<End.

romantic_music_last_till_6_12(Start,End) :- romantic_music(Start1,End1), (End1-Start1)>=6, Start is (Start1+6), End is (End1+1).

romantic_music_until_unification_of_italy_during_6_12_overlap(Start,End) :- romantic_music_last_till_6_12(Start1,End1), unification_of_italy(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

romantic_music_until_unification_of_italy_during_6_12(Start,End) :- romantic_music(W1,_), romantic_music_until_unification_of_italy_during_6_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-6), Start=<End.

romantic_music_until_unification_of_italy_during_6_12_at_1809(Res) :- setof((Start,End),romantic_music_until_unification_of_italy_during_6_12(Start,End),AllINtervals), checkvalidity(1809,AllINtervals,Res).

check_query() :- write('Query = romantic_music_until_unification_of_italy_during_6_12_at_1809'), (romantic_music_until_unification_of_italy_during_6_12_at_1809(true) -> write('\nRes   = true');write('\nRes   = false')).

