:- include('database.pl').
first_italo_ethiopian_war(Start,End) :- begin('first_italo_ethiopian_war',_,_,Start), end('first_italo_ethiopian_war',_,_,End), Start=<End.

globally_first_italo_ethiopian_war_during_1_2(Start,End) :- first_italo_ethiopian_war(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_first_italo_ethiopian_war_during_1_2_at_1922(Res) :- setof((Start,End),globally_first_italo_ethiopian_war_during_1_2(Start,End),AllINtervals), checkvalidity(1922,AllINtervals,Res).

check_query() :- write('Query = globally_first_italo_ethiopian_war_during_1_2_at_1922'), (globally_first_italo_ethiopian_war_during_1_2_at_1922(true) -> write('\nRes   = true');write('\nRes   = false')).

