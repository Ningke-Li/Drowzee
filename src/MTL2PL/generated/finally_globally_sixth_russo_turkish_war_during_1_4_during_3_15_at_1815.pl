:- include('database.pl').
sixth_russo_turkish_war(Start,End) :- begin('sixth_russo_turkish_war',_,_,Start), end('sixth_russo_turkish_war',_,_,End), Start=<End.

globally_sixth_russo_turkish_war_during_1_4(Start,End) :- sixth_russo_turkish_war(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

finally_globally_sixth_russo_turkish_war_during_1_4_during_3_15(Start,End) :- globally_sixth_russo_turkish_war_during_1_4(Start1,End1), (Start1-15)=<(End1-3), Start is (Start1-15), End is (End1-3), Start=<End.

finally_globally_sixth_russo_turkish_war_during_1_4_during_3_15_at_1815(Res) :- setof((Start,End),finally_globally_sixth_russo_turkish_war_during_1_4_during_3_15(Start,End),AllINtervals), checkvalidity(1815,AllINtervals,Res).

check_query() :- write('Query = finally_globally_sixth_russo_turkish_war_during_1_4_during_3_15_at_1815'), (finally_globally_sixth_russo_turkish_war_during_1_4_during_3_15_at_1815(true) -> write('\nRes   = true');write('\nRes   = false')).

