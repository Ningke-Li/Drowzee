:- include('database.pl').
sixth_russo_turkish_war(Start,End) :- begin('sixth_russo_turkish_war',_,_,Start), end('sixth_russo_turkish_war',_,_,End), Start=<End.

globally_sixth_russo_turkish_war_during_3_6(Start,End) :- sixth_russo_turkish_war(Start1,End1), Start is (Start1-3), End is (End1-6), Start=<End.

next_globally_sixth_russo_turkish_war_during_3_6(Start,End) :- globally_sixth_russo_turkish_war_during_3_6(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_sixth_russo_turkish_war_during_3_6_at_1689(Res) :- setof((Start,End),next_globally_sixth_russo_turkish_war_during_3_6(Start,End),AllINtervals), checkvalidity(1689,AllINtervals,Res).

check_query() :- write('Query = next_globally_sixth_russo_turkish_war_during_3_6_at_1689'), (next_globally_sixth_russo_turkish_war_during_3_6_at_1689(true) -> write('\nRes   = true');write('\nRes   = false')).

