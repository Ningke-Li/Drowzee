:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

cuban_war_of_independence(Start,End) :- begin('cuban_war_of_independence',_,_,Start), end('cuban_war_of_independence',_,_,End), Start=<End.

dutch_guilder_last_till_194_198(Start,End) :- dutch_guilder(Start1,End1), (End1-Start1)>=194, Start is (Start1+194), End is (End1+1).

dutch_guilder_until_cuban_war_of_independence_during_194_198_overlap(Start,End) :- dutch_guilder_last_till_194_198(Start1,End1), cuban_war_of_independence(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

dutch_guilder_until_cuban_war_of_independence_during_194_198(Start,End) :- dutch_guilder(W1,_), dutch_guilder_until_cuban_war_of_independence_during_194_198_overlap(Start1,End1), Start is max((Start1-198),W1), End is (End1-194), Start=<End.

dutch_guilder_until_cuban_war_of_independence_during_194_198_at_1635(Res) :- setof((Start,End),dutch_guilder_until_cuban_war_of_independence_during_194_198(Start,End),AllINtervals), checkvalidity(1635,AllINtervals,Res).

check_query() :- write('Query = dutch_guilder_until_cuban_war_of_independence_during_194_198_at_1635'), (dutch_guilder_until_cuban_war_of_independence_during_194_198_at_1635(true) -> write('\nRes   = true');write('\nRes   = false')).

