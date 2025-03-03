:- include('database.pl').
american_civil_war(Start,End) :- begin('american_civil_war',_,_,Start), end('american_civil_war',_,_,End), Start=<End.

finally_american_civil_war_during_10_18(Start,End) :- american_civil_war(Start1,End1), (Start1-18)=<(End1-10), Start is (Start1-18), End is (End1-10), Start=<End.

finally_american_civil_war_during_10_18_at_1779(Res) :- setof((Start,End),finally_american_civil_war_during_10_18(Start,End),AllINtervals), checkvalidity(1779,AllINtervals,Res).

check_query() :- write('Query = finally_american_civil_war_during_10_18_at_1779'), (finally_american_civil_war_during_10_18_at_1779(true) -> write('\nRes   = true');write('\nRes   = false')).

