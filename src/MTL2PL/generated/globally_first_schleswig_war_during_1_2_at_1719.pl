:- include('database.pl').
first_schleswig_war(Start,End) :- begin('first_schleswig_war',_,_,Start), end('first_schleswig_war',_,_,End), Start=<End.

globally_first_schleswig_war_during_1_2(Start,End) :- first_schleswig_war(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_first_schleswig_war_during_1_2_at_1719(Res) :- setof((Start,End),globally_first_schleswig_war_during_1_2(Start,End),AllINtervals), checkvalidity(1719,AllINtervals,Res).

check_query() :- write('Query = globally_first_schleswig_war_during_1_2_at_1719'), (globally_first_schleswig_war_during_1_2_at_1719(true) -> write('\nRes   = true');write('\nRes   = false')).

