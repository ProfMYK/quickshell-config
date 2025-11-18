BATTERY_INFO=$(acpi -b)

STATUS=$(echo $BATTERY_INFO | grep -Eo '(Charging|Discharging|Full|Unknown)')

PERCENTAGE=$(echo "$BATTERY_INFO" | grep -Eo '[0-9]+%')
PERCENTAGE_NUM=$(echo "$BATTERY_INFO" | grep -Eo '[0-9]+' | head -n 2 | tail -n 1)

if [ $STATUS = "Charging" ]; then
    echo $PERCENTAGE "󰂄"
else
    ICON="󰂀"
    if (( PERCENTAGE_NUM < 5 )); then
        ICON="󰂃"
    elif (( PERCENTAGE_NUM < 10 )); then
        ICON="󰂎"
    elif (( PERCENTAGE_NUM < 20 )); then
        ICON="󰁺"
    elif (( PERCENTAGE_NUM < 30 )); then
        ICON="󰁻"
    elif (( PERCENTAGE_NUM < 40 )); then
        ICON="󰁼"
    elif (( PERCENTAGE_NUM < 50 )); then
        ICON="󰁽"
    elif (( PERCENTAGE_NUM < 60 )); then
        ICON="󰁾"
    elif (( PERCENTAGE_NUM < 70 )); then
        ICON="󰁿"
    elif (( PERCENTAGE_NUM < 80 )); then
        ICON="󰂀"
    elif (( PERCENTAGE_NUM < 90 )); then
        ICON="󰂁"
    elif (( PERCENTAGE_NUM <= 100 )); then 
        TIER="󰁹"
    fi

    echo $PERCENTAGE $ICON 
fi
