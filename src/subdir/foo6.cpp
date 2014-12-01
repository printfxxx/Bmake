/*
 * Copyright (C) 2011.
 *
 * Brick Yang <printfxxx@gmail.com>
 *
 * This program is free software. You can redistribute it and/or
 * modify it as you like.
 */

/**
 * @file	foo6.cpp
 * @brief	Example only.
 */

#include <iostream>

using namespace std;

extern "C" {
void foo6(void);
}

/**
 * @brief	foo6 function.
 */
void foo6(void)
{
	cout << "module_name: " MOD_NAME ", obj_name: " OBJ_NAME ", function_name: " << __FUNCTION__ << endl;
}
