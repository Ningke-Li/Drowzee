:- include('database.pl').
korean_war(Start,End) :- begin('korean_war',_,_,Start), end('korean_war',_,_,End), Start=<End.

globally_korean_war_during_1_2(Start,End) :- korean_war(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_korean_war_during_1_2_at_1943(Res) :- setof((Start,End),globally_korean_war_during_1_2(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = globally_korean_war_during_1_2_at_1943'), (globally_korean_war_during_1_2_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).

