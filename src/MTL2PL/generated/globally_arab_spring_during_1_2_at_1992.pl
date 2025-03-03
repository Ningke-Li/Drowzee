:- include('database.pl').
arab_spring(Start,End) :- begin('arab_spring',_,_,Start), end('arab_spring',_,_,End), Start=<End.

globally_arab_spring_during_1_2(Start,End) :- arab_spring(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_arab_spring_during_1_2_at_1992(Res) :- setof((Start,End),globally_arab_spring_during_1_2(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = globally_arab_spring_during_1_2_at_1992'), (globally_arab_spring_during_1_2_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).

