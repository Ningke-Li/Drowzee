:- include('database.pl').
war_of_the_austrian_succession(Start,End) :- begin('war_of_the_austrian_succession',_,_,Start), end('war_of_the_austrian_succession',_,_,End), Start=<End.

globally_war_of_the_austrian_succession_during_6_8(Start,End) :- war_of_the_austrian_succession(Start1,End1), Start is (Start1-6), End is (End1-8), Start=<End.

globally_war_of_the_austrian_succession_during_6_8_at_1740(Res) :- setof((Start,End),globally_war_of_the_austrian_succession_during_6_8(Start,End),AllINtervals), checkvalidity(1740,AllINtervals,Res).

check_query() :- write('Query = globally_war_of_the_austrian_succession_during_6_8_at_1740'), (globally_war_of_the_austrian_succession_during_6_8_at_1740(true) -> write('\nRes   = true');write('\nRes   = false')).

