:- include('database.pl').
american_revolution(Start,End) :- begin('american_revolution',_,_,Start), end('american_revolution',_,_,End), Start=<End.

globally_american_revolution_during_1_17(Start,End) :- american_revolution(Start1,End1), Start is (Start1-1), End is (End1-17), Start=<End.

globally_american_revolution_during_1_17_at_1737(Res) :- setof((Start,End),globally_american_revolution_during_1_17(Start,End),AllINtervals), checkvalidity(1737,AllINtervals,Res).

check_query() :- write('Query = globally_american_revolution_during_1_17_at_1737'), (globally_american_revolution_during_1_17_at_1737(true) -> write('\nRes   = true');write('\nRes   = false')).

