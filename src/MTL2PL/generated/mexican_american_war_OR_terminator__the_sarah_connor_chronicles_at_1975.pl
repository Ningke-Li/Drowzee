:- include('database.pl').
mexican_american_war(Start,End) :- begin('mexican_american_war',_,_,Start), end('mexican_american_war',_,_,End), Start=<End.

terminator__the_sarah_connor_chronicles(Start,End) :- begin('terminator__the_sarah_connor_chronicles',_,_,Start), end('terminator__the_sarah_connor_chronicles',_,_,End), Start=<End.

generate_facts_mexican_american_war_OR_terminator__the_sarah_connor_chronicles([]) :- assert(mexican_american_war_OR_terminator__the_sarah_connor_chronicles(-1,-1)).

generate_facts_mexican_american_war_OR_terminator__the_sarah_connor_chronicles([(Start,End) | Tail]) :- assert(mexican_american_war_OR_terminator__the_sarah_connor_chronicles(Start,End)), generate_facts_mexican_american_war_OR_terminator__the_sarah_connor_chronicles(Tail).

mexican_american_war_OR_terminator__the_sarah_connor_chronicles_aux() :- findall((Start,End),mexican_american_war(Start,End),Interval1), findall((Start,End),terminator__the_sarah_connor_chronicles(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_mexican_american_war_OR_terminator__the_sarah_connor_chronicles(Interval).

mexican_american_war_OR_terminator__the_sarah_connor_chronicles_at_1975(Res) :- setof((Start,End),mexican_american_war_OR_terminator__the_sarah_connor_chronicles(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = mexican_american_war_OR_terminator__the_sarah_connor_chronicles_at_1975'), (mexican_american_war_OR_terminator__the_sarah_connor_chronicles_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mexican_american_war_OR_terminator__the_sarah_connor_chronicles_aux().

