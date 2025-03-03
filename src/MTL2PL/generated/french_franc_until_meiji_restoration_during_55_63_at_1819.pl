:- include('database.pl').
french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

meiji_restoration(Start,End) :- begin('meiji_restoration',_,_,Start), end('meiji_restoration',_,_,End), Start=<End.

french_franc_last_till_55_63(Start,End) :- french_franc(Start1,End1), (End1-Start1)>=55, Start is (Start1+55), End is (End1+1).

french_franc_until_meiji_restoration_during_55_63_overlap(Start,End) :- french_franc_last_till_55_63(Start1,End1), meiji_restoration(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

french_franc_until_meiji_restoration_during_55_63(Start,End) :- french_franc(W1,_), french_franc_until_meiji_restoration_during_55_63_overlap(Start1,End1), Start is max((Start1-63),W1), End is (End1-55), Start=<End.

french_franc_until_meiji_restoration_during_55_63_at_1819(Res) :- setof((Start,End),french_franc_until_meiji_restoration_during_55_63(Start,End),AllINtervals), checkvalidity(1819,AllINtervals,Res).

check_query() :- write('Query = french_franc_until_meiji_restoration_during_55_63_at_1819'), (french_franc_until_meiji_restoration_during_55_63_at_1819(true) -> write('\nRes   = true');write('\nRes   = false')).

