package enums

enum Seriousness {
    Casual(0), Serious(1), Vary_Serious(2)
    Seriousness(int value) {
        this.value = value
    }
    private final int value
    int getValue() {
        value
    }
}