#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "malloc_check.h"
#include "utils.h"
#include "ncurses.h"


char *choices[] = {
                        "Choice 1",
                        "Choice 2",
                        "Choice 3",
                        "Choice 4",
                        "Exit",
                  };

int main(void)
{
	FILE *file_pointer;
	char *pointer_array[10];
	char *pa[10][50];
	char **pointer = *pa;
	fpos_t pos;

	file_pointer = fopen_file("/home/kisi/.config/gtk-3.0/bookmarks", "r");
//read_from_file(file_pointer);


	//int j = 0;
	for (int i = 0; i <10; i++) {
		pointer_array[i] = error_check_malloc(20);
		long size = ftell(file_pointer);
	}

	for (int i = 0; i < 10; i++) {
		//pointer_array[i] = read_line_from_file(file_pointer, pos);
		*pa[i]		 = read_line_from_file(file_pointer, pos);
	}
	printf("0 %s sizeof %ld\n", *pa[0], strlen(*pa[0]));
	printf("1 %s\n", *pa[1]);
	printf("2 %s\n", *pa[2]);
	printf("3 %s\n", *pa[3]);
	printf("4 %s\n", *pa[4]);
	printf("5 %s\n", *pa[5]);
	printf("6 %s\n", *pa[6]);
	printf("7 %s\n", *pa[7]);
	*pa[8] = (char *) NULL;

	start_ncurses(pointer);

}	
