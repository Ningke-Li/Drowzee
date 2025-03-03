:- include('database.pl').
supernatural(Start,End) :- begin('supernatural',_,_,Start), end('supernatural',_,_,End), Start=<End.

european_migrant_crisis(Start,End) :- begin('european_migrant_crisis',_,_,Start), end('european_migrant_crisis',_,_,End), Start=<End.

supernatural_last_till_7_8(Start,End) :- supernatural(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

supernatural_until_european_migrant_crisis_during_7_8_overlap(Start,End) :- supernatural_last_till_7_8(Start1,End1), european_migrant_crisis(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

supernatural_until_european_migrant_crisis_during_7_8(Start,End) :- supernatural(W1,_), supernatural_until_european_migrant_crisis_during_7_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-7), Start=<End.

supernatural_until_european_migrant_crisis_during_7_8_at_2008(Res) :- setof((Start,End),supernatural_until_european_migrant_crisis_during_7_8(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = supernatural_until_european_migrant_crisis_during_7_8_at_2008'), (supernatural_until_european_migrant_crisis_during_7_8_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

