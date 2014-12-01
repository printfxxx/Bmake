/*
 * Copyright (C) 2011.
 *
 * Brick Yang <printfxxx@gmail.com>
 *
 * This program is free software. You can redistribute it and/or
 * modify it as you like.
 */

/**
 * @file	foo3.c
 * @brief	Example only.
 */

#include <stdio.h>

void foo3(void);
void foo4(void);

/**
 * @brief	foo3 function.
 */
void foo3(void)
{
	printf("module_name: %s, obj_name: %s, function_name: %s\n", MOD_NAME, OBJ_NAME, __FUNCTION__);

	foo4();
}
