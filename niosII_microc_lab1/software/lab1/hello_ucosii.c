#include <stdio.h>
#include "includes.h"
#include "altera_up_avalon_character_lcd.h"

/* Definition of Task Stacks */
#define   TASK_STACKSIZE       2048
OS_STK    task1_stk[TASK_STACKSIZE];
OS_STK    task2_stk[TASK_STACKSIZE];
OS_STK    task3_stk[TASK_STACKSIZE];

/* Definition of Task Priorities */

#define TASK1_PRIORITY      1
#define TASK2_PRIORITY      2
#define TASK3_PRIORITY      3

int sharedSwitch;
OS_EVENT *sharedSwitchKey;

/* Prints "Hello World" and sleeps for three seconds */
void task1(void* pdata)
{
	INT8U err;
	int* pointer =(int* )SWITCH_BASE;
	while (1)
	{

		OSSemPend(sharedSwitchKey, 0, &err);
		sharedSwitch = *pointer;
		OSSemPost(sharedSwitchKey);
		OSTimeDlyHMSM(0, 0, 0, 1);
	}
}
/* Prints "Hello World" and sleeps for three seconds */
void task2(void* pdata)
{
	INT8U err;
	int* pointer =(int* )GREEN_LEDS_BASE;

	while (1)
	{
		OSSemPend(sharedSwitchKey, 0, &err);
		*pointer = sharedSwitch;
		OSSemPost(sharedSwitchKey);
		OSTimeDlyHMSM(0, 0, 0, 1);
	}
}

void task3(void* pdata)
{
	INT8U err;

	int localCopy;


	alt_up_character_lcd_dev * char_lcd_dev;
	// open the Character LCD port
	char_lcd_dev = alt_up_character_lcd_open_dev ("/dev/character_lcd_0");
	if ( char_lcd_dev == NULL)
	alt_printf ("Error: could not open character LCD device\n");
	else
	alt_printf ("Opened character LCD device\n");

	while (1)
	{
		OSSemPend(sharedSwitchKey, 0, &err);

		localCopy = sharedSwitch;

		OSSemPost(sharedSwitchKey);

		alt_up_character_lcd_init (char_lcd_dev);

		if (localCopy){
			alt_up_character_lcd_set_cursor_pos(char_lcd_dev, 0, 0);
		}
		else {
			alt_up_character_lcd_set_cursor_pos(char_lcd_dev, 0, 1);
		}
		alt_up_character_lcd_string(char_lcd_dev, "WIN");
		OSTimeDlyHMSM(0, 0, 0, 1);
	}
}
/* The main function creates two task and starts multi-tasking */
int main(void)
{

	OSTaskCreateExt(task1,
			NULL,
			(void *)&task1_stk[TASK_STACKSIZE-1],
			TASK1_PRIORITY,
			TASK1_PRIORITY,
			task1_stk,
			TASK_STACKSIZE,
			NULL,
			0);


	OSTaskCreateExt(task2,
			NULL,
			(void *)&task2_stk[TASK_STACKSIZE-1],
			TASK2_PRIORITY,
			TASK2_PRIORITY,
			task2_stk,
			TASK_STACKSIZE,
			NULL,
			0);

	OSTaskCreateExt(task3,
			NULL,
			(void *)&task3_stk[TASK_STACKSIZE-1],
			TASK3_PRIORITY,
			TASK3_PRIORITY,
			task3_stk,
			TASK_STACKSIZE,
			NULL,
			0);
	OSStart();
	return 0;
}
