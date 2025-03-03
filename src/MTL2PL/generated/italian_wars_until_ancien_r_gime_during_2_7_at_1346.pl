:- include('database.pl').
italian_wars(Start,End) :- begin('italian_wars',_,_,Start), end('italian_wars',_,_,End), Start=<End.

ancien_r_gime(Start,End) :- begin('ancien_r_gime',_,_,Start), end('ancien_r_gime',_,_,End), Start=<End.

italian_wars_last_till_2_7(Start,End) :- italian_wars(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

italian_wars_until_ancien_r_gime_during_2_7_overlap(Start,End) :- italian_wars_last_till_2_7(Start1,End1), ancien_r_gime(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

italian_wars_until_ancien_r_gime_during_2_7(Start,End) :- italian_wars(W1,_), italian_wars_until_ancien_r_gime_during_2_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-2), Start=<End.

italian_wars_until_ancien_r_gime_during_2_7_at_1346(Res) :- setof((Start,End),italian_wars_until_ancien_r_gime_during_2_7(Start,End),AllINtervals), checkvalidity(1346,AllINtervals,Res).

check_query() :- write('Query = italian_wars_until_ancien_r_gime_during_2_7_at_1346'), (italian_wars_until_ancien_r_gime_during_2_7_at_1346(true) -> write('\nRes   = true');write('\nRes   = false')).

