:- include('database.pl').
second_italo_ethiopian_war(Start,End) :- begin('second_italo_ethiopian_war',_,_,Start), end('second_italo_ethiopian_war',_,_,End), Start=<End.

globally_second_italo_ethiopian_war_during_1_2(Start,End) :- second_italo_ethiopian_war(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_second_italo_ethiopian_war_during_1_2_at_1941(Res) :- setof((Start,End),globally_second_italo_ethiopian_war_during_1_2(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = globally_second_italo_ethiopian_war_during_1_2_at_1941'), (globally_second_italo_ethiopian_war_during_1_2_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).

