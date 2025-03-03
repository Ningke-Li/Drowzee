:- include('database.pl').
convertible_peso(Start,End) :- begin('convertible_peso',_,_,Start), end('convertible_peso',_,_,End), Start=<End.

finally_convertible_peso_during_4_14(Start,End) :- convertible_peso(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

globally_finally_convertible_peso_during_4_14_during_6_8(Start,End) :- finally_convertible_peso_during_4_14(Start1,End1), Start is (Start1-6), End is (End1-8), Start=<End.

globally_finally_convertible_peso_during_4_14_during_6_8_at_2009(Res) :- setof((Start,End),globally_finally_convertible_peso_during_4_14_during_6_8(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = globally_finally_convertible_peso_during_4_14_during_6_8_at_2009'), (globally_finally_convertible_peso_during_4_14_during_6_8_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

