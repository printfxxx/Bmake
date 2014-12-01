/*
 * Copyright (C) 2011.
 *
 * Brick Yang <printfxxx@gmail.com>
 *
 * This program is free software. You can redistribute it and/or
 * modify it as you like.
 */

/**
 * @file	foo4.c
 * @brief	Example only.
 */

#include <stdio.h>

void foo4(void);
void foo5(void);

/**
 * @brief	foo4 function.
 */
void foo4(void)
{
	printf("module_name: %s, obj_name: %s, function_name: %s\n", MOD_NAME, OBJ_NAME, __FUNCTION__);
	foo5();
}
