:- include('database.pl').
second_anglo_afghan_war(Start,End) :- begin('second_anglo_afghan_war',_,_,Start), end('second_anglo_afghan_war',_,_,End), Start=<End.

globally_second_anglo_afghan_war_during_1_2(Start,End) :- second_anglo_afghan_war(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_second_anglo_afghan_war_during_1_2_at_1877(Res) :- setof((Start,End),globally_second_anglo_afghan_war_during_1_2(Start,End),AllINtervals), checkvalidity(1877,AllINtervals,Res).

check_query() :- write('Query = globally_second_anglo_afghan_war_during_1_2_at_1877'), (globally_second_anglo_afghan_war_during_1_2_at_1877(true) -> write('\nRes   = true');write('\nRes   = false')).

