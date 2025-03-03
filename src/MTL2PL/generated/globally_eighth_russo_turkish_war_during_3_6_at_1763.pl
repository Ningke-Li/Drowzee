:- include('database.pl').
eighth_russo_turkish_war(Start,End) :- begin('eighth_russo_turkish_war',_,_,Start), end('eighth_russo_turkish_war',_,_,End), Start=<End.

globally_eighth_russo_turkish_war_during_3_6(Start,End) :- eighth_russo_turkish_war(Start1,End1), Start is (Start1-3), End is (End1-6), Start=<End.

globally_eighth_russo_turkish_war_during_3_6_at_1763(Res) :- setof((Start,End),globally_eighth_russo_turkish_war_during_3_6(Start,End),AllINtervals), checkvalidity(1763,AllINtervals,Res).

check_query() :- write('Query = globally_eighth_russo_turkish_war_during_3_6_at_1763'), (globally_eighth_russo_turkish_war_during_3_6_at_1763(true) -> write('\nRes   = true');write('\nRes   = false')).

