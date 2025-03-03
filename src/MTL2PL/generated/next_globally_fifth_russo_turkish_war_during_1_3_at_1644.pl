:- include('database.pl').
fifth_russo_turkish_war(Start,End) :- begin('fifth_russo_turkish_war',_,_,Start), end('fifth_russo_turkish_war',_,_,End), Start=<End.

globally_fifth_russo_turkish_war_during_1_3(Start,End) :- fifth_russo_turkish_war(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_fifth_russo_turkish_war_during_1_3(Start,End) :- globally_fifth_russo_turkish_war_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_fifth_russo_turkish_war_during_1_3_at_1644(Res) :- setof((Start,End),next_globally_fifth_russo_turkish_war_during_1_3(Start,End),AllINtervals), checkvalidity(1644,AllINtervals,Res).

check_query() :- write('Query = next_globally_fifth_russo_turkish_war_during_1_3_at_1644'), (next_globally_fifth_russo_turkish_war_during_1_3_at_1644(true) -> write('\nRes   = true');write('\nRes   = false')).

