:- include('database.pl').
second_boer_war(Start,End) :- begin('second_boer_war',_,_,Start), end('second_boer_war',_,_,End), Start=<End.

globally_second_boer_war_during_1_2(Start,End) :- second_boer_war(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

next_globally_second_boer_war_during_1_2(Start,End) :- globally_second_boer_war_during_1_2(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_second_boer_war_during_1_2_at_1897(Res) :- setof((Start,End),next_globally_second_boer_war_during_1_2(Start,End),AllINtervals), checkvalidity(1897,AllINtervals,Res).

check_query() :- write('Query = next_globally_second_boer_war_during_1_2_at_1897'), (next_globally_second_boer_war_during_1_2_at_1897(true) -> write('\nRes   = true');write('\nRes   = false')).

