:- include('database.pl').
stockholm_bloodbath(Start,End) :- begin('stockholm_bloodbath',_,_,Start), end('stockholm_bloodbath',_,_,End), Start=<End.

finally_stockholm_bloodbath_during_2_20(Start,End) :- stockholm_bloodbath(Start1,End1), (Start1-20)=<(End1-2), Start is (Start1-20), End is (End1-2), Start=<End.

finally_stockholm_bloodbath_during_2_20_at_1500(Res) :- setof((Start,End),finally_stockholm_bloodbath_during_2_20(Start,End),AllINtervals), checkvalidity(1500,AllINtervals,Res).

check_query() :- write('Query = finally_stockholm_bloodbath_during_2_20_at_1500'), (finally_stockholm_bloodbath_during_2_20_at_1500(true) -> write('\nRes   = true');write('\nRes   = false')).

