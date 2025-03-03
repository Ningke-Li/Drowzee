:- include('database.pl').
portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

finally_portuguese_escudo_during_6_14(Start,End) :- portuguese_escudo(Start1,End1), (Start1-14)=<(End1-6), Start is (Start1-14), End is (End1-6), Start=<End.

globally_finally_portuguese_escudo_during_6_14_during_35_89(Start,End) :- finally_portuguese_escudo_during_6_14(Start1,End1), Start is (Start1-35), End is (End1-89), Start=<End.

globally_finally_portuguese_escudo_during_6_14_during_35_89_at_1867(Res) :- setof((Start,End),globally_finally_portuguese_escudo_during_6_14_during_35_89(Start,End),AllINtervals), checkvalidity(1867,AllINtervals,Res).

check_query() :- write('Query = globally_finally_portuguese_escudo_during_6_14_during_35_89_at_1867'), (globally_finally_portuguese_escudo_during_6_14_during_35_89_at_1867(true) -> write('\nRes   = true');write('\nRes   = false')).

