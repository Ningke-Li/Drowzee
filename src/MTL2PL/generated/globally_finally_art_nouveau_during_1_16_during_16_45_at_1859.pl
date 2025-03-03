:- include('database.pl').
art_nouveau(Start,End) :- begin('art_nouveau',_,_,Start), end('art_nouveau',_,_,End), Start=<End.

finally_art_nouveau_during_1_16(Start,End) :- art_nouveau(Start1,End1), (Start1-16)=<(End1-1), Start is (Start1-16), End is (End1-1), Start=<End.

globally_finally_art_nouveau_during_1_16_during_16_45(Start,End) :- finally_art_nouveau_during_1_16(Start1,End1), Start is (Start1-16), End is (End1-45), Start=<End.

globally_finally_art_nouveau_during_1_16_during_16_45_at_1859(Res) :- setof((Start,End),globally_finally_art_nouveau_during_1_16_during_16_45(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = globally_finally_art_nouveau_during_1_16_during_16_45_at_1859'), (globally_finally_art_nouveau_during_1_16_during_16_45_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).

