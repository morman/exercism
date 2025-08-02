class SpaceAge:
    # define seconds per year
    SECONDS_PER_YEAR = 31557600
    # define significant digits for tests
    SIG_DIGS = 2

    # initialize object with seconds
    def __init__(self, seconds):
        # initialize seconds
        self.seconds = seconds

    def on_earth(self):
        return round(self.seconds / self.SECONDS_PER_YEAR, self.SIG_DIGS)

    def on_mercury(self):
        return round(self.seconds / (self.SECONDS_PER_YEAR * 0.2408467), self.SIG_DIGS)

    def on_venus(self):
        return round(self.seconds / (self.SECONDS_PER_YEAR * 0.61519726), self.SIG_DIGS)

    def on_mars(self):
        return round(self.seconds / (self.SECONDS_PER_YEAR * 1.8808158), self.SIG_DIGS)

    def on_jupiter(self):
        return round(self.seconds / (self.SECONDS_PER_YEAR * 11.862615), self.SIG_DIGS)

    def on_saturn(self):
        return round(self.seconds / (self.SECONDS_PER_YEAR * 29.447498), self.SIG_DIGS)

    def on_uranus(self):
        return round(self.seconds / (self.SECONDS_PER_YEAR * 84.016846), self.SIG_DIGS)

    def on_neptune(self):
        return round(self.seconds / (self.SECONDS_PER_YEAR * 164.79132), self.SIG_DIGS)