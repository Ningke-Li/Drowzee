:- include('database.pl').
snowboarding_at_the_2014_winter_olympics(Start,End) :- begin('snowboarding_at_the_2014_winter_olympics',_,_,Start), end('snowboarding_at_the_2014_winter_olympics',_,_,End), Start=<End.

copa_am_rica_centenario(Start,End) :- begin('copa_am_rica_centenario',_,_,Start), end('copa_am_rica_centenario',_,_,End), Start=<End.

generate_facts_snowboarding_at_the_2014_winter_olympics_OR_copa_am_rica_centenario([]) :- assert(snowboarding_at_the_2014_winter_olympics_OR_copa_am_rica_centenario(-1,-1)).

generate_facts_snowboarding_at_the_2014_winter_olympics_OR_copa_am_rica_centenario([(Start,End) | Tail]) :- assert(snowboarding_at_the_2014_winter_olympics_OR_copa_am_rica_centenario(Start,End)), generate_facts_snowboarding_at_the_2014_winter_olympics_OR_copa_am_rica_centenario(Tail).

snowboarding_at_the_2014_winter_olympics_OR_copa_am_rica_centenario_aux() :- findall((Start,End),snowboarding_at_the_2014_winter_olympics(Start,End),Interval1), findall((Start,End),copa_am_rica_centenario(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_snowboarding_at_the_2014_winter_olympics_OR_copa_am_rica_centenario(Interval).

snowboarding_at_the_2014_winter_olympics_OR_copa_am_rica_centenario_at_1970(Res) :- setof((Start,End),snowboarding_at_the_2014_winter_olympics_OR_copa_am_rica_centenario(Start,End),AllINtervals), checkvalidity(1970,AllINtervals,Res).

check_query() :- write('Query = snowboarding_at_the_2014_winter_olympics_OR_copa_am_rica_centenario_at_1970'), (snowboarding_at_the_2014_winter_olympics_OR_copa_am_rica_centenario_at_1970(true) -> write('\nRes   = true');write('\nRes   = false')).
?- snowboarding_at_the_2014_winter_olympics_OR_copa_am_rica_centenario_aux().

