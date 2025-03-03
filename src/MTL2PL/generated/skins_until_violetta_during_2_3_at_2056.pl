:- include('database.pl').
skins(Start,End) :- begin('skins',_,_,Start), end('skins',_,_,End), Start=<End.

violetta(Start,End) :- begin('violetta',_,_,Start), end('violetta',_,_,End), Start=<End.

skins_last_till_2_3(Start,End) :- skins(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

skins_until_violetta_during_2_3_overlap(Start,End) :- skins_last_till_2_3(Start1,End1), violetta(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

skins_until_violetta_during_2_3(Start,End) :- skins(W1,_), skins_until_violetta_during_2_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-2), Start=<End.

skins_until_violetta_during_2_3_at_2056(Res) :- setof((Start,End),skins_until_violetta_during_2_3(Start,End),AllINtervals), checkvalidity(2056,AllINtervals,Res).

check_query() :- write('Query = skins_until_violetta_during_2_3_at_2056'), (skins_until_violetta_during_2_3_at_2056(true) -> write('\nRes   = true');write('\nRes   = false')).

