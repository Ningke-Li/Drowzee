:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

california_gold_rush(Start,End) :- begin('california_gold_rush',_,_,Start), end('california_gold_rush',_,_,End), Start=<End.

dutch_guilder_last_till_253_260(Start,End) :- dutch_guilder(Start1,End1), (End1-Start1)>=253, Start is (Start1+253), End is (End1+1).

dutch_guilder_until_california_gold_rush_during_253_260_overlap(Start,End) :- dutch_guilder_last_till_253_260(Start1,End1), california_gold_rush(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

dutch_guilder_until_california_gold_rush_during_253_260(Start,End) :- dutch_guilder(W1,_), dutch_guilder_until_california_gold_rush_during_253_260_overlap(Start1,End1), Start is max((Start1-260),W1), End is (End1-253), Start=<End.

dutch_guilder_until_california_gold_rush_during_253_260_at_1588(Res) :- setof((Start,End),dutch_guilder_until_california_gold_rush_during_253_260(Start,End),AllINtervals), checkvalidity(1588,AllINtervals,Res).

check_query() :- write('Query = dutch_guilder_until_california_gold_rush_during_253_260_at_1588'), (dutch_guilder_until_california_gold_rush_during_253_260_at_1588(true) -> write('\nRes   = true');write('\nRes   = false')).

