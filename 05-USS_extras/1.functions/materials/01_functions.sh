#!/bin/bash
function fun1_name
{
	echo "I am Fun1"
}

function fun2_name { echo "I am Fun2"; }

fun3_name()
{
	echo "I am Fun3"
}

fun4_name() { echo "I am Fun4"; }

fun1_name
fun2_name
fun3_name
fun4_name
