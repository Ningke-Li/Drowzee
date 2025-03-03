:- include('database.pl').
tokyo_ghoul(Start,End) :- begin('tokyo_ghoul',_,_,Start), end('tokyo_ghoul',_,_,End), Start=<End.

finally_tokyo_ghoul_during_5_20(Start,End) :- tokyo_ghoul(Start1,End1), (Start1-20)=<(End1-5), Start is (Start1-20), End is (End1-5), Start=<End.

finally_tokyo_ghoul_during_5_20_at_2012(Res) :- setof((Start,End),finally_tokyo_ghoul_during_5_20(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = finally_tokyo_ghoul_during_5_20_at_2012'), (finally_tokyo_ghoul_during_5_20_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

