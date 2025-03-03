:- include('database.pl').
first_opium_war(Start,End) :- begin('first_opium_war',_,_,Start), end('first_opium_war',_,_,End), Start=<End.

globally_first_opium_war_during_2_3(Start,End) :- first_opium_war(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

next_globally_first_opium_war_during_2_3(Start,End) :- globally_first_opium_war_during_2_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_first_opium_war_during_2_3_at_1837(Res) :- setof((Start,End),next_globally_first_opium_war_during_2_3(Start,End),AllINtervals), checkvalidity(1837,AllINtervals,Res).

check_query() :- write('Query = next_globally_first_opium_war_during_2_3_at_1837'), (next_globally_first_opium_war_during_2_3_at_1837(true) -> write('\nRes   = true');write('\nRes   = false')).

