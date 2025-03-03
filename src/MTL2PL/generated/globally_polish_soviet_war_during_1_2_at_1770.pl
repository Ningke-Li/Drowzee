:- include('database.pl').
polish_soviet_war(Start,End) :- begin('polish_soviet_war',_,_,Start), end('polish_soviet_war',_,_,End), Start=<End.

globally_polish_soviet_war_during_1_2(Start,End) :- polish_soviet_war(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_polish_soviet_war_during_1_2_at_1770(Res) :- setof((Start,End),globally_polish_soviet_war_during_1_2(Start,End),AllINtervals), checkvalidity(1770,AllINtervals,Res).

check_query() :- write('Query = globally_polish_soviet_war_during_1_2_at_1770'), (globally_polish_soviet_war_during_1_2_at_1770(true) -> write('\nRes   = true');write('\nRes   = false')).

