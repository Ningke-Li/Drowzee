:- include('database.pl').
czechoslovak_koruna(Start,End) :- begin('czechoslovak_koruna',_,_,Start), end('czechoslovak_koruna',_,_,End), Start=<End.

dust_bowl(Start,End) :- begin('dust_bowl',_,_,Start), end('dust_bowl',_,_,End), Start=<End.

czechoslovak_koruna_last_till_1_7(Start,End) :- czechoslovak_koruna(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

czechoslovak_koruna_until_dust_bowl_during_1_7_overlap(Start,End) :- czechoslovak_koruna_last_till_1_7(Start1,End1), dust_bowl(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

czechoslovak_koruna_until_dust_bowl_during_1_7(Start,End) :- czechoslovak_koruna(W1,_), czechoslovak_koruna_until_dust_bowl_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

czechoslovak_koruna_until_dust_bowl_during_1_7_at_1844(Res) :- setof((Start,End),czechoslovak_koruna_until_dust_bowl_during_1_7(Start,End),AllINtervals), checkvalidity(1844,AllINtervals,Res).

check_query() :- write('Query = czechoslovak_koruna_until_dust_bowl_during_1_7_at_1844'), (czechoslovak_koruna_until_dust_bowl_during_1_7_at_1844(true) -> write('\nRes   = true');write('\nRes   = false')).

