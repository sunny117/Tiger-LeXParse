%.lex.sml : %.lex
	mllex $<

%.grm.sml : %.grm
	mlyacc $<

PHONY : all clean test

all : parsing

parsing: ast.sml tiger.sml tiger.mlb tiger.grm.sml tiger.lex.sml indent.sml
	mlton -output parsing tiger.mlb

clean :
	rm -f parsing
	rm -f tiger.lex.sml
	rm -f tiger.grm.desc
	rm -f tiger.grm.sig
	rm -f tiger.grm.sml

test: parsing
	$(CURDIR)/parsing tests/simple_array.txt
	$(CURDIR)/parsing tests/simple_for.txt
	$(CURDIR)/parsing tests/simple_if.txt
	$(CURDIR)/parsing tests/simple_let.txt
	$(CURDIR)/parsing tests/simple_while.txt
