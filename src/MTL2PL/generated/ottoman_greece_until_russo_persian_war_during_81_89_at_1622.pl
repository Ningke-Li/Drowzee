:- include('database.pl').
ottoman_greece(Start,End) :- begin('ottoman_greece',_,_,Start), end('ottoman_greece',_,_,End), Start=<End.

russo_persian_war(Start,End) :- begin('russo_persian_war',_,_,Start), end('russo_persian_war',_,_,End), Start=<End.

ottoman_greece_last_till_81_89(Start,End) :- ottoman_greece(Start1,End1), (End1-Start1)>=81, Start is (Start1+81), End is (End1+1).

ottoman_greece_until_russo_persian_war_during_81_89_overlap(Start,End) :- ottoman_greece_last_till_81_89(Start1,End1), russo_persian_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ottoman_greece_until_russo_persian_war_during_81_89(Start,End) :- ottoman_greece(W1,_), ottoman_greece_until_russo_persian_war_during_81_89_overlap(Start1,End1), Start is max((Start1-89),W1), End is (End1-81), Start=<End.

ottoman_greece_until_russo_persian_war_during_81_89_at_1622(Res) :- setof((Start,End),ottoman_greece_until_russo_persian_war_during_81_89(Start,End),AllINtervals), checkvalidity(1622,AllINtervals,Res).

check_query() :- write('Query = ottoman_greece_until_russo_persian_war_during_81_89_at_1622'), (ottoman_greece_until_russo_persian_war_during_81_89_at_1622(true) -> write('\nRes   = true');write('\nRes   = false')).

