:- include('database.pl').
first_schleswig_war(Start,End) :- begin('first_schleswig_war',_,_,Start), end('first_schleswig_war',_,_,End), Start=<End.

globally_first_schleswig_war_during_1_3(Start,End) :- first_schleswig_war(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_first_schleswig_war_during_1_3(Start,End) :- globally_first_schleswig_war_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_first_schleswig_war_during_1_3_at_1846(Res) :- setof((Start,End),next_globally_first_schleswig_war_during_1_3(Start,End),AllINtervals), checkvalidity(1846,AllINtervals,Res).

check_query() :- write('Query = next_globally_first_schleswig_war_during_1_3_at_1846'), (next_globally_first_schleswig_war_during_1_3_at_1846(true) -> write('\nRes   = true');write('\nRes   = false')).

