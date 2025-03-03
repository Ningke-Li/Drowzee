:- include('database.pl').
eighth_russo_turkish_war(Start,End) :- begin('eighth_russo_turkish_war',_,_,Start), end('eighth_russo_turkish_war',_,_,End), Start=<End.

globally_eighth_russo_turkish_war_during_4_6(Start,End) :- eighth_russo_turkish_war(Start1,End1), Start is (Start1-4), End is (End1-6), Start=<End.

finally_globally_eighth_russo_turkish_war_during_4_6_during_6_12(Start,End) :- globally_eighth_russo_turkish_war_during_4_6(Start1,End1), (Start1-12)=<(End1-6), Start is (Start1-12), End is (End1-6), Start=<End.

finally_globally_eighth_russo_turkish_war_during_4_6_during_6_12_at_1798(Res) :- setof((Start,End),finally_globally_eighth_russo_turkish_war_during_4_6_during_6_12(Start,End),AllINtervals), checkvalidity(1798,AllINtervals,Res).

check_query() :- write('Query = finally_globally_eighth_russo_turkish_war_during_4_6_during_6_12_at_1798'), (finally_globally_eighth_russo_turkish_war_during_4_6_during_6_12_at_1798(true) -> write('\nRes   = true');write('\nRes   = false')).

