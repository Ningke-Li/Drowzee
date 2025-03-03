:- include('database.pl').
fifth_russo_turkish_war(Start,End) :- begin('fifth_russo_turkish_war',_,_,Start), end('fifth_russo_turkish_war',_,_,End), Start=<End.

finally_fifth_russo_turkish_war_during_2_20(Start,End) :- fifth_russo_turkish_war(Start1,End1), (Start1-20)=<(End1-2), Start is (Start1-20), End is (End1-2), Start=<End.

finally_fifth_russo_turkish_war_during_2_20_at_1772(Res) :- setof((Start,End),finally_fifth_russo_turkish_war_during_2_20(Start,End),AllINtervals), checkvalidity(1772,AllINtervals,Res).

check_query() :- write('Query = finally_fifth_russo_turkish_war_during_2_20_at_1772'), (finally_fifth_russo_turkish_war_during_2_20_at_1772(true) -> write('\nRes   = true');write('\nRes   = false')).

