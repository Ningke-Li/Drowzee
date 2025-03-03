:- include('database.pl').
second_boer_war(Start,End) :- begin('second_boer_war',_,_,Start), end('second_boer_war',_,_,End), Start=<End.

next_second_boer_war(Start,End) :- second_boer_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_second_boer_war_at_1767(Res) :- setof((Start,End),next_second_boer_war(Start,End),AllINtervals), checkvalidity(1767,AllINtervals,Res).

check_query() :- write('Query = next_second_boer_war_at_1767'), (next_second_boer_war_at_1767(true) -> write('\nRes   = true');write('\nRes   = false')).

