:- include('database.pl').
twitter(Start,End) :- begin('twitter',_,_,Start), end('twitter',_,_,End), Start=<End.

triathlon_at_the_2016_summer_olympics(Start,End) :- begin('triathlon_at_the_2016_summer_olympics',_,_,Start), end('triathlon_at_the_2016_summer_olympics',_,_,End), Start=<End.

generate_facts_twitter_OR_triathlon_at_the_2016_summer_olympics([]) :- assert(twitter_OR_triathlon_at_the_2016_summer_olympics(-1,-1)).

generate_facts_twitter_OR_triathlon_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(twitter_OR_triathlon_at_the_2016_summer_olympics(Start,End)), generate_facts_twitter_OR_triathlon_at_the_2016_summer_olympics(Tail).

twitter_OR_triathlon_at_the_2016_summer_olympics_aux() :- findall((Start,End),twitter(Start,End),Interval1), findall((Start,End),triathlon_at_the_2016_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_twitter_OR_triathlon_at_the_2016_summer_olympics(Interval).

twitter_OR_triathlon_at_the_2016_summer_olympics_at_2021(Res) :- setof((Start,End),twitter_OR_triathlon_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(2021,AllINtervals,Res).

check_query() :- write('Query = twitter_OR_triathlon_at_the_2016_summer_olympics_at_2021'), (twitter_OR_triathlon_at_the_2016_summer_olympics_at_2021(true) -> write('\nRes   = true');write('\nRes   = false')).
?- twitter_OR_triathlon_at_the_2016_summer_olympics_aux().

