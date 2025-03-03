:- include('database.pl').
american_revolution(Start,End) :- begin('american_revolution',_,_,Start), end('american_revolution',_,_,End), Start=<End.

globally_american_revolution_during_12_14(Start,End) :- american_revolution(Start1,End1), Start is (Start1-12), End is (End1-14), Start=<End.

next_globally_american_revolution_during_12_14(Start,End) :- globally_american_revolution_during_12_14(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_american_revolution_during_12_14_at_1639(Res) :- setof((Start,End),next_globally_american_revolution_during_12_14(Start,End),AllINtervals), checkvalidity(1639,AllINtervals,Res).

check_query() :- write('Query = next_globally_american_revolution_during_12_14_at_1639'), (next_globally_american_revolution_during_12_14_at_1639(true) -> write('\nRes   = true');write('\nRes   = false')).

