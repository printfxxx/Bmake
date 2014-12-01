/*
 * Copyright (C) 2011.
 *
 * Brick Yang <printfxxx@gmail.com>
 *
 * This program is free software. You can redistribute it and/or
 * modify it as you like.
 */

/**
 * @file	main.c
 * @brief	Example only.
 */

#include <stdio.h>
#include <xxx.h>

void foo1(void);

/**
 * @brief	Main function.
 *
 * @param	argc   - Number of argument
 * @param	argv[] - Arguments
 *
 * @return	Always 0.
 */
int main(int argc, char *argv[])
{
	(void)argc;
	(void)argv;

	printf("This is only an example!\n");
	printf("module_name: %s, obj_name: %s, function_name: %s\n", MOD_NAME, OBJ_NAME, __FUNCTION__);

	foo1();

	lib1();
	lib2();
	lib3();

	return 0;
}
