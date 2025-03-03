:- include('database.pl').
american_indian_wars(Start,End) :- begin('american_indian_wars',_,_,Start), end('american_indian_wars',_,_,End), Start=<End.

finally_american_indian_wars_during_2_16(Start,End) :- american_indian_wars(Start1,End1), (Start1-16)=<(End1-2), Start is (Start1-16), End is (End1-2), Start=<End.

next_finally_american_indian_wars_during_2_16(Start,End) :- finally_american_indian_wars_during_2_16(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_american_indian_wars_during_2_16_at_1774(Res) :- setof((Start,End),next_finally_american_indian_wars_during_2_16(Start,End),AllINtervals), checkvalidity(1774,AllINtervals,Res).

check_query() :- write('Query = next_finally_american_indian_wars_during_2_16_at_1774'), (next_finally_american_indian_wars_during_2_16_at_1774(true) -> write('\nRes   = true');write('\nRes   = false')).

