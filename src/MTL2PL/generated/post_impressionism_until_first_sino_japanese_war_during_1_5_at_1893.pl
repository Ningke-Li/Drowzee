:- include('database.pl').
post_impressionism(Start,End) :- begin('post_impressionism',_,_,Start), end('post_impressionism',_,_,End), Start=<End.

first_sino_japanese_war(Start,End) :- begin('first_sino_japanese_war',_,_,Start), end('first_sino_japanese_war',_,_,End), Start=<End.

post_impressionism_last_till_1_5(Start,End) :- post_impressionism(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

post_impressionism_until_first_sino_japanese_war_during_1_5_overlap(Start,End) :- post_impressionism_last_till_1_5(Start1,End1), first_sino_japanese_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

post_impressionism_until_first_sino_japanese_war_during_1_5(Start,End) :- post_impressionism(W1,_), post_impressionism_until_first_sino_japanese_war_during_1_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-1), Start=<End.

post_impressionism_until_first_sino_japanese_war_during_1_5_at_1893(Res) :- setof((Start,End),post_impressionism_until_first_sino_japanese_war_during_1_5(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = post_impressionism_until_first_sino_japanese_war_during_1_5_at_1893'), (post_impressionism_until_first_sino_japanese_war_during_1_5_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).

