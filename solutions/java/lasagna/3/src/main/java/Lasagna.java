public class Lasagna {
    /**
     * Helper class for calculating lasagna cooking and preparation times.
     */
    // Expected oven time in minutes for a lasagna
    private static final int EXPECTED_OVEN_TIME_IN_MINUTES = 40;
    // Preparation minutes required per layer
    private static final int PREPARATION_MINUTES_PER_LAYER = 2;

    /**
     * Returns the expected oven time in minutes for a lasagna.
     */
    public int expectedMinutesInOven() {
        return EXPECTED_OVEN_TIME_IN_MINUTES;
    }

    /**
     * Calculates the remaining oven time based on how long it has already been baking.
     *
     * @param actualMinutesInOven minutes the lasagna has been in the oven
     * @return remaining minutes until the lasagna reaches the expected oven time
     */
    public int remainingMinutesInOven(int actualMinutesInOven) {
        return expectedMinutesInOven() - actualMinutesInOven;
    }

    /**
     * Calculates the preparation time based on the number of layers.
     *
     * @param numberOfLayers number of layers added to the lasagna
     * @return minutes spent preparing the lasagna
     */
    public int preparationTimeInMinutes(int numberOfLayers) {
        return numberOfLayers * PREPARATION_MINUTES_PER_LAYER;
    }

    /**
     * Calculates the total time spent so far cooking the lasagna.
     *
     * @param numberOfLayers number of layers added to the lasagna
     * @param minutesInOven  minutes the lasagna has been in the oven
     * @return total minutes spent: preparation time + minutes in oven
     */
    public int totalTimeInMinutes(int numberOfLayers, int minutesInOven) {
        return preparationTimeInMinutes(numberOfLayers) + minutesInOven;
    }
}
