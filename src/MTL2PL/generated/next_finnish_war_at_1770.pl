:- include('database.pl').
finnish_war(Start,End) :- begin('finnish_war',_,_,Start), end('finnish_war',_,_,End), Start=<End.

next_finnish_war(Start,End) :- finnish_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finnish_war_at_1770(Res) :- setof((Start,End),next_finnish_war(Start,End),AllINtervals), checkvalidity(1770,AllINtervals,Res).

check_query() :- write('Query = next_finnish_war_at_1770'), (next_finnish_war_at_1770(true) -> write('\nRes   = true');write('\nRes   = false')).

