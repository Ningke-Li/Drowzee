:- include('database.pl').
third_russo_turkish_war(Start,End) :- begin('third_russo_turkish_war',_,_,Start), end('third_russo_turkish_war',_,_,End), Start=<End.

globally_third_russo_turkish_war_during_2_13(Start,End) :- third_russo_turkish_war(Start1,End1), Start is (Start1-2), End is (End1-13), Start=<End.

next_globally_third_russo_turkish_war_during_2_13(Start,End) :- globally_third_russo_turkish_war_during_2_13(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_third_russo_turkish_war_during_2_13_at_1683(Res) :- setof((Start,End),next_globally_third_russo_turkish_war_during_2_13(Start,End),AllINtervals), checkvalidity(1683,AllINtervals,Res).

check_query() :- write('Query = next_globally_third_russo_turkish_war_during_2_13_at_1683'), (next_globally_third_russo_turkish_war_during_2_13_at_1683(true) -> write('\nRes   = true');write('\nRes   = false')).

