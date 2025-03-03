:- include('database.pl').
second_libyan_civil_war(Start,End) :- begin('second_libyan_civil_war',_,_,Start), end('second_libyan_civil_war',_,_,End), Start=<End.

finally_second_libyan_civil_war_during_4_12(Start,End) :- second_libyan_civil_war(Start1,End1), (Start1-12)=<(End1-4), Start is (Start1-12), End is (End1-4), Start=<End.

next_finally_second_libyan_civil_war_during_4_12(Start,End) :- finally_second_libyan_civil_war_during_4_12(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_second_libyan_civil_war_during_4_12_at_2008(Res) :- setof((Start,End),next_finally_second_libyan_civil_war_during_4_12(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = next_finally_second_libyan_civil_war_during_4_12_at_2008'), (next_finally_second_libyan_civil_war_during_4_12_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

