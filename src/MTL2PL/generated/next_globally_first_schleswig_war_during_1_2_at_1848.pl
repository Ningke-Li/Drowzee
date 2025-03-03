:- include('database.pl').
first_schleswig_war(Start,End) :- begin('first_schleswig_war',_,_,Start), end('first_schleswig_war',_,_,End), Start=<End.

globally_first_schleswig_war_during_1_2(Start,End) :- first_schleswig_war(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

next_globally_first_schleswig_war_during_1_2(Start,End) :- globally_first_schleswig_war_during_1_2(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_first_schleswig_war_during_1_2_at_1848(Res) :- setof((Start,End),next_globally_first_schleswig_war_during_1_2(Start,End),AllINtervals), checkvalidity(1848,AllINtervals,Res).

check_query() :- write('Query = next_globally_first_schleswig_war_during_1_2_at_1848'), (next_globally_first_schleswig_war_during_1_2_at_1848(true) -> write('\nRes   = true');write('\nRes   = false')).

