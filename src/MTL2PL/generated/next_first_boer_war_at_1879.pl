:- include('database.pl').
first_boer_war(Start,End) :- begin('first_boer_war',_,_,Start), end('first_boer_war',_,_,End), Start=<End.

next_first_boer_war(Start,End) :- first_boer_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_first_boer_war_at_1879(Res) :- setof((Start,End),next_first_boer_war(Start,End),AllINtervals), checkvalidity(1879,AllINtervals,Res).

check_query() :- write('Query = next_first_boer_war_at_1879'), (next_first_boer_war_at_1879(true) -> write('\nRes   = true');write('\nRes   = false')).

