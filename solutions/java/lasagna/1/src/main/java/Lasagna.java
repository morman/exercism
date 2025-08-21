public class Lasagna {
    // define expected cooking time in minutes
    private static final int EXPECTED_OVEN_TIME_IN_MINUTES = 40;
    // define expected prep time per layer 
    private static final int PREPARATION_MINUTES_PER_LAYER = 2;

    // define expected minutes in oven for normal pizza
    public int expectedMinutesInOven() {
        return EXPECTED_OVEN_TIME_IN_MINUTES;
    }
    // given minutes in oven determine remaining minutes
    public int remainingMinutesInOven(int actualMinutesInOven) {
        return EXPECTED_OVEN_TIME_IN_MINUTES - actualMinutesInOven;
    }

    // given number of layers, determine prep time
    public int preparationTimeInMinutes(int numberOfLayers) {
        return numberOfLayers * PREPARATION_MINUTES_PER_LAYER;
    }

    // given layer prep time and minutes in the oven, determine total time to make the pizza
    public int totalTimeInMinutes(int numberOfLayers, int minutesInOven) {
        return preparationTimeInMinutes(numberOfLayers) + minutesInOven;
    }
}
