:- include('database.pl').
terminator__the_sarah_connor_chronicles(Start,End) :- begin('terminator__the_sarah_connor_chronicles',_,_,Start), end('terminator__the_sarah_connor_chronicles',_,_,End), Start=<End.

the_penguins_of_madagascar(Start,End) :- begin('the_penguins_of_madagascar',_,_,Start), end('the_penguins_of_madagascar',_,_,End), Start=<End.

generate_facts_terminator__the_sarah_connor_chronicles_AND_the_penguins_of_madagascar([]) :- assert(terminator__the_sarah_connor_chronicles_AND_the_penguins_of_madagascar(-1,-1)).

generate_facts_terminator__the_sarah_connor_chronicles_AND_the_penguins_of_madagascar([(Start,End) | Tail]) :- assert(terminator__the_sarah_connor_chronicles_AND_the_penguins_of_madagascar(Start,End)), generate_facts_terminator__the_sarah_connor_chronicles_AND_the_penguins_of_madagascar(Tail).

terminator__the_sarah_connor_chronicles_AND_the_penguins_of_madagascar_aux() :- findall((Start,End),terminator__the_sarah_connor_chronicles(Start,End),Interval1), findall((Start,End),the_penguins_of_madagascar(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_terminator__the_sarah_connor_chronicles_AND_the_penguins_of_madagascar(Interval).

terminator__the_sarah_connor_chronicles_AND_the_penguins_of_madagascar_at_2032(Res) :- setof((Start,End),terminator__the_sarah_connor_chronicles_AND_the_penguins_of_madagascar(Start,End),AllINtervals), checkvalidity(2032,AllINtervals,Res).

check_query() :- write('Query = terminator__the_sarah_connor_chronicles_AND_the_penguins_of_madagascar_at_2032'), (terminator__the_sarah_connor_chronicles_AND_the_penguins_of_madagascar_at_2032(true) -> write('\nRes   = true');write('\nRes   = false')).
?- terminator__the_sarah_connor_chronicles_AND_the_penguins_of_madagascar_aux().

