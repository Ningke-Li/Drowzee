:- include('database.pl').
peninsular_war(Start,End) :- begin('peninsular_war',_,_,Start), end('peninsular_war',_,_,End), Start=<End.

next_peninsular_war(Start,End) :- peninsular_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_peninsular_war_at_1773(Res) :- setof((Start,End),next_peninsular_war(Start,End),AllINtervals), checkvalidity(1773,AllINtervals,Res).

check_query() :- write('Query = next_peninsular_war_at_1773'), (next_peninsular_war_at_1773(true) -> write('\nRes   = true');write('\nRes   = false')).

