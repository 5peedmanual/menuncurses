#################################
#	PROGRAM NAME		#
#################################
PROGRAM_NAME		:= menu
#################################



#################################
#	  BUILD DIR		#
#################################
MAKE_DIR		:= /home/kisi/programacaoC/menusncurses/
SOURCE_DIR 		:= src/


PROGRAM_BUILD_DIR 	:= $(MAKE_DIR)build/
PROGRAM_LIBS_DIR	:= $(MAKE_DIR)build/libs/
EXTERNAL_LIBS_DIR	:= /usr/local/src/build/libs/
PROGRAM_OBJS_DIR	:= $(BUILD_DIR)objs/


#################################
#################################
#	  COMPILER		#
#################################
# You dont know C flag extra
EXTRA_FLAGS	:= -Wall -Wextra -Wshadow -Wpointer-arith -Wcast-align \
            		-Wwrite-strings -Wmissing-prototypes -Wmissing-declarations \
            		-Wredundant-decls -Wnested-externs -Winline -Wno-long-long \
            		-Wconversion -Wstrict-prototypes
#EXTRA_FLAGS	+= -pedantic
DEBUG_FLAG	:= -g


# Compiler to use
CC 			:= gcc
# Flags for the compiler
CFLAGS 		:= $(DEBUG_FLAG) -std=gnu99
#CFLAGS		+= $(EXTRA_FLAGS)




#################################
#	 C PRE-PROCESSOR	#
#################################
# What flags should be passed to the C pre-processor
# In other words, where should we look for files to include
# This doenst include compiler specific directories
CPPFLAGS	:= -I. \
		-I$(INCLUDE_DIR)

## CLIENT INCLUDES FOR SEARCH
PROGRAM_INCLUDE_DIR	:= $(MAKE_DIR)include/

INCLUDE_SRCH_PATH 	:= 
INCLUDE_SRCH_PATH	+= -I$(PROGRAM_INCLUDE_DIR)

# External libraries
INCLUDE_SRCH_PATH	+= -I/usr/local/include/utils/
INCLUDE_SRCH_PATH	+= -I/usr/local/include/error_handling/
#INCLUDE_SRCH_PATH 	+= -I$(INCLUDE_DIR)client


#################################



#################################
#	     LINKER		#
#################################

# Directory for libs


# Where to look for libraries to link
LDFLAGS			:= -L. \
			-L$(PROGRAM_LIBS_DIR) \
			-L$(EXTERNAL_LIBS_DIR)

## LDLIBS
			
PROGRAM_LIBS		:= -lutils -lerror
PROGRAM_LIBS		+= -lncurses -lmenu

#################################





#################################
#	.c FILES		#
#################################
# Source files

SOURCE_FILES		:= $(SOURCE_DIR)

#################################


export MAKE_DIR CC CFLAGS
export MAKE_DIR BUILD_DIR INCLUDE_DIR LIBS_DIR OBJS_DIR
export LDFLAGS INCLUDE_SRCH_PATH 
export PROGRAM_NAME PROGRAM_LIBS 



#
#
# Link command:
all: $(PROGRAM_NAME) 


#################################
#	    TARGETS		#
#################################


# make -C ./dir1
# make -C ./dir2

# This actually spawns/forks a new child process for every make call.
$(PROGRAM_NAME): 	
	$(info compiling $(PROGRAM_NAME) ...)
	@$(MAKE) -C $(SOURCE_DIR) -f main.mk			--no-print-directory




################################




# A phony target is one that is not really the name of a file;
# rather it is just a name for a recipe to be executed when you make an
# explicit request. There are two reasons to use a phony target: to avoid a
# conflict with a file of the same name, and to improve performance.
# removes the executables and removes build/ directory

.PHONY: create clean cleandir cleanelfs

# creates a build/ directory for the binaries
create:
	mkdir -p build/libs
	mkdir -p build/objs


printobjs:
	$(info echo $(OBJS))

OBJS = $(shell find ./ -name "*.o")
clean:
	-rm -r build/
	-rm $(OBJS)


cleanelfs:
	-rm $(CLIENT_SRC)$(CLIENT_PROGRAM_NAME)
	-rm $(SERVER_SRC)$(SERVER_PROGRAM_NAME)
