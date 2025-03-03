:- include('database.pl').
carnatic_wars(Start,End) :- begin('carnatic_wars',_,_,Start), end('carnatic_wars',_,_,End), Start=<End.

globally_carnatic_wars_during_1_17(Start,End) :- carnatic_wars(Start1,End1), Start is (Start1-1), End is (End1-17), Start=<End.

globally_carnatic_wars_during_1_17_at_1745(Res) :- setof((Start,End),globally_carnatic_wars_during_1_17(Start,End),AllINtervals), checkvalidity(1745,AllINtervals,Res).

check_query() :- write('Query = globally_carnatic_wars_during_1_17_at_1745'), (globally_carnatic_wars_during_1_17_at_1745(true) -> write('\nRes   = true');write('\nRes   = false')).

