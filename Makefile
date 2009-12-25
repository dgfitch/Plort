NAME=plort
OS?=osx
include Makefile.$(OS) 


#.SILENT:

all: clean build run

clean:
	$(RM) $(NAME).love

test:
	tsc spec/*spec.lua

test_verbose:
	tsc -f spec/*spec.lua

build: clean
	cd love && $(ZIP) ../$(NAME).zip .
	mv $(NAME).zip $(NAME).love

run: build
	$(LOVE) $(NAME).love	

publish: build
	scp $(NAME).love mindfill.com:www/projects/games/plort
