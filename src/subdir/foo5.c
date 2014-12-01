/*
 * Copyright (C) 2011.
 *
 * Brick Yang <printfxxx@gmail.com>
 *
 * This program is free software. You can redistribute it and/or
 * modify it as you like.
 */

/**
 * @file	foo5.c
 * @brief	Example only.
 */

#include <stdio.h>

void foo5(void);
void foo6(void);

/**
 * @brief	foo5 function.
 */
void foo5(void)
{
	printf("module_name: %s, obj_name: %s, function_name: %s\n", MOD_NAME, OBJ_NAME, __FUNCTION__);
	foo6();
}
