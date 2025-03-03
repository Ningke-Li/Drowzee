:- include('database.pl').
paraguayan_war(Start,End) :- begin('paraguayan_war',_,_,Start), end('paraguayan_war',_,_,End), Start=<End.

globally_paraguayan_war_during_3_4(Start,End) :- paraguayan_war(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

next_globally_paraguayan_war_during_3_4(Start,End) :- globally_paraguayan_war_during_3_4(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_paraguayan_war_during_3_4_at_1865(Res) :- setof((Start,End),next_globally_paraguayan_war_during_3_4(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = next_globally_paraguayan_war_during_3_4_at_1865'), (next_globally_paraguayan_war_during_3_4_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).

