:- include('database.pl').
baroque(Start,End) :- begin('baroque',_,_,Start), end('baroque',_,_,End), Start=<End.

polish_muscovite_war(Start,End) :- begin('polish_muscovite_war',_,_,Start), end('polish_muscovite_war',_,_,End), Start=<End.

baroque_last_till_17_21(Start,End) :- baroque(Start1,End1), (End1-Start1)>=17, Start is (Start1+17), End is (End1+1).

baroque_until_polish_muscovite_war_during_17_21_overlap(Start,End) :- baroque_last_till_17_21(Start1,End1), polish_muscovite_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

baroque_until_polish_muscovite_war_during_17_21(Start,End) :- baroque(W1,_), baroque_until_polish_muscovite_war_during_17_21_overlap(Start1,End1), Start is max((Start1-21),W1), End is (End1-17), Start=<End.

baroque_until_polish_muscovite_war_during_17_21_at_1586(Res) :- setof((Start,End),baroque_until_polish_muscovite_war_during_17_21(Start,End),AllINtervals), checkvalidity(1586,AllINtervals,Res).

check_query() :- write('Query = baroque_until_polish_muscovite_war_during_17_21_at_1586'), (baroque_until_polish_muscovite_war_during_17_21_at_1586(true) -> write('\nRes   = true');write('\nRes   = false')).

