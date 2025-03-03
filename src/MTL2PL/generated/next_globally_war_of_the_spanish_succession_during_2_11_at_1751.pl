:- include('database.pl').
war_of_the_spanish_succession(Start,End) :- begin('war_of_the_spanish_succession',_,_,Start), end('war_of_the_spanish_succession',_,_,End), Start=<End.

globally_war_of_the_spanish_succession_during_2_11(Start,End) :- war_of_the_spanish_succession(Start1,End1), Start is (Start1-2), End is (End1-11), Start=<End.

next_globally_war_of_the_spanish_succession_during_2_11(Start,End) :- globally_war_of_the_spanish_succession_during_2_11(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_war_of_the_spanish_succession_during_2_11_at_1751(Res) :- setof((Start,End),next_globally_war_of_the_spanish_succession_during_2_11(Start,End),AllINtervals), checkvalidity(1751,AllINtervals,Res).

check_query() :- write('Query = next_globally_war_of_the_spanish_succession_during_2_11_at_1751'), (next_globally_war_of_the_spanish_succession_during_2_11_at_1751(true) -> write('\nRes   = true');write('\nRes   = false')).

