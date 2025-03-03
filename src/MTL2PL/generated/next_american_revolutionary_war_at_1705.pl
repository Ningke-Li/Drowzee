:- include('database.pl').
american_revolutionary_war(Start,End) :- begin('american_revolutionary_war',_,_,Start), end('american_revolutionary_war',_,_,End), Start=<End.

next_american_revolutionary_war(Start,End) :- american_revolutionary_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_american_revolutionary_war_at_1705(Res) :- setof((Start,End),next_american_revolutionary_war(Start,End),AllINtervals), checkvalidity(1705,AllINtervals,Res).

check_query() :- write('Query = next_american_revolutionary_war_at_1705'), (next_american_revolutionary_war_at_1705(true) -> write('\nRes   = true');write('\nRes   = false')).

