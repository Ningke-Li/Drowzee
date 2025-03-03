:- include('database.pl').
american_indian_wars(Start,End) :- begin('american_indian_wars',_,_,Start), end('american_indian_wars',_,_,End), Start=<End.

taish__period(Start,End) :- begin('taish__period',_,_,Start), end('taish__period',_,_,End), Start=<End.

american_indian_wars_last_till_69_71(Start,End) :- american_indian_wars(Start1,End1), (End1-Start1)>=69, Start is (Start1+69), End is (End1+1).

american_indian_wars_until_taish__period_during_69_71_overlap(Start,End) :- american_indian_wars_last_till_69_71(Start1,End1), taish__period(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

american_indian_wars_until_taish__period_during_69_71(Start,End) :- american_indian_wars(W1,_), american_indian_wars_until_taish__period_during_69_71_overlap(Start1,End1), Start is max((Start1-71),W1), End is (End1-69), Start=<End.

american_indian_wars_until_taish__period_during_69_71_at_1692(Res) :- setof((Start,End),american_indian_wars_until_taish__period_during_69_71(Start,End),AllINtervals), checkvalidity(1692,AllINtervals,Res).

check_query() :- write('Query = american_indian_wars_until_taish__period_during_69_71_at_1692'), (american_indian_wars_until_taish__period_during_69_71_at_1692(true) -> write('\nRes   = true');write('\nRes   = false')).

