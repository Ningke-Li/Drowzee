:- include('database.pl').
jackie_chan_adventures(Start,End) :- begin('jackie_chan_adventures',_,_,Start), end('jackie_chan_adventures',_,_,End), Start=<End.

finally_jackie_chan_adventures_during_1_13(Start,End) :- jackie_chan_adventures(Start1,End1), (Start1-13)=<(End1-1), Start is (Start1-13), End is (End1-1), Start=<End.

globally_finally_jackie_chan_adventures_during_1_13_during_4_14(Start,End) :- finally_jackie_chan_adventures_during_1_13(Start1,End1), Start is (Start1-4), End is (End1-14), Start=<End.

globally_finally_jackie_chan_adventures_during_1_13_during_4_14_at_1985(Res) :- setof((Start,End),globally_finally_jackie_chan_adventures_during_1_13_during_4_14(Start,End),AllINtervals), checkvalidity(1985,AllINtervals,Res).

check_query() :- write('Query = globally_finally_jackie_chan_adventures_during_1_13_during_4_14_at_1985'), (globally_finally_jackie_chan_adventures_during_1_13_during_4_14_at_1985(true) -> write('\nRes   = true');write('\nRes   = false')).

