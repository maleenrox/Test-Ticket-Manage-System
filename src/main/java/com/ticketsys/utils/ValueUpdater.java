package com.ticketsys.utils;

public class ValueUpdater {
    public static int valueAdder(int value, int addValue) {
        return value + addValue;
    }

    public static int valueSubstractor(int value, int subValue) {
        int result = value - subValue;

        if (result <= 0) {
            result = 0;
        }
        return result;
    }

    public static int valueMultiplier(int value, int mulValue) {
        return value * mulValue;
    }
}
