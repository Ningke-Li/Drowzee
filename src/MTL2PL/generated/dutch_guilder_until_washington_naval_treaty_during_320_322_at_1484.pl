:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

washington_naval_treaty(Start,End) :- begin('washington_naval_treaty',_,_,Start), end('washington_naval_treaty',_,_,End), Start=<End.

dutch_guilder_last_till_320_322(Start,End) :- dutch_guilder(Start1,End1), (End1-Start1)>=320, Start is (Start1+320), End is (End1+1).

dutch_guilder_until_washington_naval_treaty_during_320_322_overlap(Start,End) :- dutch_guilder_last_till_320_322(Start1,End1), washington_naval_treaty(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

dutch_guilder_until_washington_naval_treaty_during_320_322(Start,End) :- dutch_guilder(W1,_), dutch_guilder_until_washington_naval_treaty_during_320_322_overlap(Start1,End1), Start is max((Start1-322),W1), End is (End1-320), Start=<End.

dutch_guilder_until_washington_naval_treaty_during_320_322_at_1484(Res) :- setof((Start,End),dutch_guilder_until_washington_naval_treaty_during_320_322(Start,End),AllINtervals), checkvalidity(1484,AllINtervals,Res).

check_query() :- write('Query = dutch_guilder_until_washington_naval_treaty_during_320_322_at_1484'), (dutch_guilder_until_washington_naval_treaty_during_320_322_at_1484(true) -> write('\nRes   = true');write('\nRes   = false')).

