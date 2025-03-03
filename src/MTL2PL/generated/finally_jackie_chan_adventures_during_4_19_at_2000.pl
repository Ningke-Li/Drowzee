:- include('database.pl').
jackie_chan_adventures(Start,End) :- begin('jackie_chan_adventures',_,_,Start), end('jackie_chan_adventures',_,_,End), Start=<End.

finally_jackie_chan_adventures_during_4_19(Start,End) :- jackie_chan_adventures(Start1,End1), (Start1-19)=<(End1-4), Start is (Start1-19), End is (End1-4), Start=<End.

finally_jackie_chan_adventures_during_4_19_at_2000(Res) :- setof((Start,End),finally_jackie_chan_adventures_during_4_19(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = finally_jackie_chan_adventures_during_4_19_at_2000'), (finally_jackie_chan_adventures_during_4_19_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

