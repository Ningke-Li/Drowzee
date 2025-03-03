:- include('database.pl').
skins(Start,End) :- begin('skins',_,_,Start), end('skins',_,_,End), Start=<End.

scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

skins_last_till_1_8(Start,End) :- skins(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

skins_until_scooby_doo__mystery_incorporated_during_1_8_overlap(Start,End) :- skins_last_till_1_8(Start1,End1), scooby_doo__mystery_incorporated(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

skins_until_scooby_doo__mystery_incorporated_during_1_8(Start,End) :- skins(W1,_), skins_until_scooby_doo__mystery_incorporated_during_1_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-1), Start=<End.

skins_until_scooby_doo__mystery_incorporated_during_1_8_at_1969(Res) :- setof((Start,End),skins_until_scooby_doo__mystery_incorporated_during_1_8(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = skins_until_scooby_doo__mystery_incorporated_during_1_8_at_1969'), (skins_until_scooby_doo__mystery_incorporated_during_1_8_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).

