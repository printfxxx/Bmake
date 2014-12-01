/*
 * Copyright (C) 2011.
 *
 * Brick Yang <printfxxx@gmail.com>
 *
 * This program is free software. You can redistribute it and/or
 * modify it as you like.
 */

/**
 * @file	foo2.c
 * @brief	Example only.
 */

#include <stdio.h>

void foo2(void);
void foo3(void);

/**
 * @brief	foo2 function.
 */
void foo2(void)
{
	printf("module_name: %s, obj_name: %s, function_name: %s\n", MOD_NAME, OBJ_NAME, __FUNCTION__);

	foo3();
}
