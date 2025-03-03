:- include('database.pl').
american_civil_war(Start,End) :- begin('american_civil_war',_,_,Start), end('american_civil_war',_,_,End), Start=<End.

next_american_civil_war(Start,End) :- american_civil_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_american_civil_war_at_1753(Res) :- setof((Start,End),next_american_civil_war(Start,End),AllINtervals), checkvalidity(1753,AllINtervals,Res).

check_query() :- write('Query = next_american_civil_war_at_1753'), (next_american_civil_war_at_1753(true) -> write('\nRes   = true');write('\nRes   = false')).

