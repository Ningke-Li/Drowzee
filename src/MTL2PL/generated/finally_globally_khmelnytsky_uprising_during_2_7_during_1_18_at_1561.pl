:- include('database.pl').
khmelnytsky_uprising(Start,End) :- begin('khmelnytsky_uprising',_,_,Start), end('khmelnytsky_uprising',_,_,End), Start=<End.

globally_khmelnytsky_uprising_during_2_7(Start,End) :- khmelnytsky_uprising(Start1,End1), Start is (Start1-2), End is (End1-7), Start=<End.

finally_globally_khmelnytsky_uprising_during_2_7_during_1_18(Start,End) :- globally_khmelnytsky_uprising_during_2_7(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

finally_globally_khmelnytsky_uprising_during_2_7_during_1_18_at_1561(Res) :- setof((Start,End),finally_globally_khmelnytsky_uprising_during_2_7_during_1_18(Start,End),AllINtervals), checkvalidity(1561,AllINtervals,Res).

check_query() :- write('Query = finally_globally_khmelnytsky_uprising_during_2_7_during_1_18_at_1561'), (finally_globally_khmelnytsky_uprising_during_2_7_during_1_18_at_1561(true) -> write('\nRes   = true');write('\nRes   = false')).

