:- include('database.pl').
habsburg_spain(Start,End) :- begin('habsburg_spain',_,_,Start), end('habsburg_spain',_,_,End), Start=<End.

polish_muscovite_war(Start,End) :- begin('polish_muscovite_war',_,_,Start), end('polish_muscovite_war',_,_,End), Start=<End.

habsburg_spain_last_till_20_24(Start,End) :- habsburg_spain(Start1,End1), (End1-Start1)>=20, Start is (Start1+20), End is (End1+1).

habsburg_spain_until_polish_muscovite_war_during_20_24_overlap(Start,End) :- habsburg_spain_last_till_20_24(Start1,End1), polish_muscovite_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

habsburg_spain_until_polish_muscovite_war_during_20_24(Start,End) :- habsburg_spain(W1,_), habsburg_spain_until_polish_muscovite_war_during_20_24_overlap(Start1,End1), Start is max((Start1-24),W1), End is (End1-20), Start=<End.

habsburg_spain_until_polish_muscovite_war_during_20_24_at_1492(Res) :- setof((Start,End),habsburg_spain_until_polish_muscovite_war_during_20_24(Start,End),AllINtervals), checkvalidity(1492,AllINtervals,Res).

check_query() :- write('Query = habsburg_spain_until_polish_muscovite_war_during_20_24_at_1492'), (habsburg_spain_until_polish_muscovite_war_during_20_24_at_1492(true) -> write('\nRes   = true');write('\nRes   = false')).

