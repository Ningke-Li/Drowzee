:- include('database.pl').
first_anglo_afghan_war(Start,End) :- begin('first_anglo_afghan_war',_,_,Start), end('first_anglo_afghan_war',_,_,End), Start=<End.

globally_first_anglo_afghan_war_during_1_3(Start,End) :- first_anglo_afghan_war(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_first_anglo_afghan_war_during_1_3(Start,End) :- globally_first_anglo_afghan_war_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_first_anglo_afghan_war_during_1_3_at_1827(Res) :- setof((Start,End),next_globally_first_anglo_afghan_war_during_1_3(Start,End),AllINtervals), checkvalidity(1827,AllINtervals,Res).

check_query() :- write('Query = next_globally_first_anglo_afghan_war_during_1_3_at_1827'), (next_globally_first_anglo_afghan_war_during_1_3_at_1827(true) -> write('\nRes   = true');write('\nRes   = false')).

