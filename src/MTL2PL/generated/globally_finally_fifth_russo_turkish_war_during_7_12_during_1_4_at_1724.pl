:- include('database.pl').
fifth_russo_turkish_war(Start,End) :- begin('fifth_russo_turkish_war',_,_,Start), end('fifth_russo_turkish_war',_,_,End), Start=<End.

finally_fifth_russo_turkish_war_during_7_12(Start,End) :- fifth_russo_turkish_war(Start1,End1), (Start1-12)=<(End1-7), Start is (Start1-12), End is (End1-7), Start=<End.

globally_finally_fifth_russo_turkish_war_during_7_12_during_1_4(Start,End) :- finally_fifth_russo_turkish_war_during_7_12(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

globally_finally_fifth_russo_turkish_war_during_7_12_during_1_4_at_1724(Res) :- setof((Start,End),globally_finally_fifth_russo_turkish_war_during_7_12_during_1_4(Start,End),AllINtervals), checkvalidity(1724,AllINtervals,Res).

check_query() :- write('Query = globally_finally_fifth_russo_turkish_war_during_7_12_during_1_4_at_1724'), (globally_finally_fifth_russo_turkish_war_during_7_12_during_1_4_at_1724(true) -> write('\nRes   = true');write('\nRes   = false')).

