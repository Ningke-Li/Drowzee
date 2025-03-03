:- include('database.pl').
council_of_trent(Start,End) :- begin('council_of_trent',_,_,Start), end('council_of_trent',_,_,End), Start=<End.

globally_council_of_trent_during_12_13(Start,End) :- council_of_trent(Start1,End1), Start is (Start1-12), End is (End1-13), Start=<End.

finally_globally_council_of_trent_during_12_13_during_8_12(Start,End) :- globally_council_of_trent_during_12_13(Start1,End1), (Start1-12)=<(End1-8), Start is (Start1-12), End is (End1-8), Start=<End.

finally_globally_council_of_trent_during_12_13_during_8_12_at_1536(Res) :- setof((Start,End),finally_globally_council_of_trent_during_12_13_during_8_12(Start,End),AllINtervals), checkvalidity(1536,AllINtervals,Res).

check_query() :- write('Query = finally_globally_council_of_trent_during_12_13_during_8_12_at_1536'), (finally_globally_council_of_trent_during_12_13_during_8_12_at_1536(true) -> write('\nRes   = true');write('\nRes   = false')).

