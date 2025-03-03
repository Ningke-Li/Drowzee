:- include('database.pl').
american_indian_wars(Start,End) :- begin('american_indian_wars',_,_,Start), end('american_indian_wars',_,_,End), Start=<End.

next_american_indian_wars(Start,End) :- american_indian_wars(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_american_indian_wars_at_1831(Res) :- setof((Start,End),next_american_indian_wars(Start,End),AllINtervals), checkvalidity(1831,AllINtervals,Res).

check_query() :- write('Query = next_american_indian_wars_at_1831'), (next_american_indian_wars_at_1831(true) -> write('\nRes   = true');write('\nRes   = false')).

