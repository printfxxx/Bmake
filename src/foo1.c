/*
 * Copyright (C) 2011.
 *
 * Brick Yang <printfxxx@gmail.com>
 *
 * This program is free software. You can redistribute it and/or
 * modify it as you like.
 */

/**
 * @file	foo1.c
 * @brief	Example only.
 */

#include <stdio.h>

void foo1(void);
void foo2(void);

/**
 * @brief	foo1 function.
 */
void foo1(void)
{
	printf("module_name: %s, obj_name: %s, function_name: %s\n", MOD_NAME, OBJ_NAME, __FUNCTION__);

	foo2();
}
