:- include('database.pl').
korean_war(Start,End) :- begin('korean_war',_,_,Start), end('korean_war',_,_,End), Start=<End.

globally_korean_war_during_2_3(Start,End) :- korean_war(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

globally_korean_war_during_2_3_at_1836(Res) :- setof((Start,End),globally_korean_war_during_2_3(Start,End),AllINtervals), checkvalidity(1836,AllINtervals,Res).

check_query() :- write('Query = globally_korean_war_during_2_3_at_1836'), (globally_korean_war_during_2_3_at_1836(true) -> write('\nRes   = true');write('\nRes   = false')).

