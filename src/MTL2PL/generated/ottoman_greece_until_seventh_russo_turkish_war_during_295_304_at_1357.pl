:- include('database.pl').
ottoman_greece(Start,End) :- begin('ottoman_greece',_,_,Start), end('ottoman_greece',_,_,End), Start=<End.

seventh_russo_turkish_war(Start,End) :- begin('seventh_russo_turkish_war',_,_,Start), end('seventh_russo_turkish_war',_,_,End), Start=<End.

ottoman_greece_last_till_295_304(Start,End) :- ottoman_greece(Start1,End1), (End1-Start1)>=295, Start is (Start1+295), End is (End1+1).

ottoman_greece_until_seventh_russo_turkish_war_during_295_304_overlap(Start,End) :- ottoman_greece_last_till_295_304(Start1,End1), seventh_russo_turkish_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ottoman_greece_until_seventh_russo_turkish_war_during_295_304(Start,End) :- ottoman_greece(W1,_), ottoman_greece_until_seventh_russo_turkish_war_during_295_304_overlap(Start1,End1), Start is max((Start1-304),W1), End is (End1-295), Start=<End.

ottoman_greece_until_seventh_russo_turkish_war_during_295_304_at_1357(Res) :- setof((Start,End),ottoman_greece_until_seventh_russo_turkish_war_during_295_304(Start,End),AllINtervals), checkvalidity(1357,AllINtervals,Res).

check_query() :- write('Query = ottoman_greece_until_seventh_russo_turkish_war_during_295_304_at_1357'), (ottoman_greece_until_seventh_russo_turkish_war_during_295_304_at_1357(true) -> write('\nRes   = true');write('\nRes   = false')).

