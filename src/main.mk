# $@    Nome da regra.
# $<    Nome da primeira dependência
# $^ 	Lista de dependências
# $? 	Lista de dependências mais recentes que a regra.
# $* 	Nome do arquivo sem sufixo



LIBS = $(PROGRAM_LIBS)
#LDFLAGS = $(patsubst %,-L%,$(dir $(LIBS))) $(patsubst lib%.a,-l%,$(notdir $(LIBS)))
SRCS 	= $(wildcard *.c) 
OBJS 	= $(patsubst %.c, %.o, $(SRCS))



# client client.c LIBS (linterface lnetworking lutils) -o client
$(PROGRAM_NAME): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) $(PROGRAM_LIBS) -o $@


$(OBJS): $(SRCS)
	$(CC) $(CFLAGS) $(INCLUDE_SRCH_PATH) -c -o $@ $(patsubst %o, %c, $@)


