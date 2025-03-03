:- include('database.pl').
mexican_revolution(Start,End) :- begin('mexican_revolution',_,_,Start), end('mexican_revolution',_,_,End), Start=<End.

finally_mexican_revolution_during_4_20(Start,End) :- mexican_revolution(Start1,End1), (Start1-20)=<(End1-4), Start is (Start1-20), End is (End1-4), Start=<End.

globally_finally_mexican_revolution_during_4_20_during_2_23(Start,End) :- finally_mexican_revolution_during_4_20(Start1,End1), Start is (Start1-2), End is (End1-23), Start=<End.

globally_finally_mexican_revolution_during_4_20_during_2_23_at_1760(Res) :- setof((Start,End),globally_finally_mexican_revolution_during_4_20_during_2_23(Start,End),AllINtervals), checkvalidity(1760,AllINtervals,Res).

check_query() :- write('Query = globally_finally_mexican_revolution_during_4_20_during_2_23_at_1760'), (globally_finally_mexican_revolution_during_4_20_during_2_23_at_1760(true) -> write('\nRes   = true');write('\nRes   = false')).

