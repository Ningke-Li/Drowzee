:- include('database.pl').
carnatic_wars(Start,End) :- begin('carnatic_wars',_,_,Start), end('carnatic_wars',_,_,End), Start=<End.

finally_carnatic_wars_during_9_12(Start,End) :- carnatic_wars(Start1,End1), (Start1-12)=<(End1-9), Start is (Start1-12), End is (End1-9), Start=<End.

finally_carnatic_wars_during_9_12_at_1751(Res) :- setof((Start,End),finally_carnatic_wars_during_9_12(Start,End),AllINtervals), checkvalidity(1751,AllINtervals,Res).

check_query() :- write('Query = finally_carnatic_wars_during_9_12_at_1751'), (finally_carnatic_wars_during_9_12_at_1751(true) -> write('\nRes   = true');write('\nRes   = false')).

