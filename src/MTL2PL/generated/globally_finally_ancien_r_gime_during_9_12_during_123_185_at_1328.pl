:- include('database.pl').
ancien_r_gime(Start,End) :- begin('ancien_r_gime',_,_,Start), end('ancien_r_gime',_,_,End), Start=<End.

finally_ancien_r_gime_during_9_12(Start,End) :- ancien_r_gime(Start1,End1), (Start1-12)=<(End1-9), Start is (Start1-12), End is (End1-9), Start=<End.

globally_finally_ancien_r_gime_during_9_12_during_123_185(Start,End) :- finally_ancien_r_gime_during_9_12(Start1,End1), Start is (Start1-123), End is (End1-185), Start=<End.

globally_finally_ancien_r_gime_during_9_12_during_123_185_at_1328(Res) :- setof((Start,End),globally_finally_ancien_r_gime_during_9_12_during_123_185(Start,End),AllINtervals), checkvalidity(1328,AllINtervals,Res).

check_query() :- write('Query = globally_finally_ancien_r_gime_during_9_12_during_123_185_at_1328'), (globally_finally_ancien_r_gime_during_9_12_during_123_185_at_1328(true) -> write('\nRes   = true');write('\nRes   = false')).

