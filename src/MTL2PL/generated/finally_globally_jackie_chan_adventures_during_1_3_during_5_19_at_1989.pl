:- include('database.pl').
jackie_chan_adventures(Start,End) :- begin('jackie_chan_adventures',_,_,Start), end('jackie_chan_adventures',_,_,End), Start=<End.

globally_jackie_chan_adventures_during_1_3(Start,End) :- jackie_chan_adventures(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

finally_globally_jackie_chan_adventures_during_1_3_during_5_19(Start,End) :- globally_jackie_chan_adventures_during_1_3(Start1,End1), (Start1-19)=<(End1-5), Start is (Start1-19), End is (End1-5), Start=<End.

finally_globally_jackie_chan_adventures_during_1_3_during_5_19_at_1989(Res) :- setof((Start,End),finally_globally_jackie_chan_adventures_during_1_3_during_5_19(Start,End),AllINtervals), checkvalidity(1989,AllINtervals,Res).

check_query() :- write('Query = finally_globally_jackie_chan_adventures_during_1_3_during_5_19_at_1989'), (finally_globally_jackie_chan_adventures_during_1_3_during_5_19_at_1989(true) -> write('\nRes   = true');write('\nRes   = false')).

