:- include('database.pl').
nikita(Start,End) :- begin('nikita',_,_,Start), end('nikita',_,_,End), Start=<End.

globally_nikita_during_1_3(Start,End) :- nikita(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_nikita_during_1_3_at_2009(Res) :- setof((Start,End),globally_nikita_during_1_3(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = globally_nikita_during_1_3_at_2009'), (globally_nikita_during_1_3_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

