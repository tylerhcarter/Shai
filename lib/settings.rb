# These are the constants for the runtime

return if defined? SETTINGS_SET
SETTINGS_SET = true

# GENERAL RUNTIME SETTING

# Number of moves per run
MOVES = 100

PRINT_ACTIONS = true

PRINT_SCOREBOARD = true

# ACTION SETTINGS

# Chance person forgot to lock house
PERSON_LOCK_CHANCE = 50

# Default maximum attempts for theives to breakin
THIEF_MAX_ATTEMPTS = 100

# Chance for Arsonist to successfully burn a house
ARSONIST_BURN_CHANCE = 100

# MONEY SETTINGS

# Money each person starts with
PERSON_START_MONEY = 100
PROGRAMMER_START_MONEY = 5

# Money gotten from working
WORKER_PAY_PER_MOVE = 1

# Maximum money counterfeitters can create
COUNTERFEIT_MAX_CREATE = 50

# SECURITY SETTINGS

# Startup seeds
REGULAR_KEY_SEED = 100
REGULAR_KEY_FAILURE_CHANCE = 1000

ADVANCED_KEY_SEED = 255

# Key seeds when breaking in
THIEF_BREAKIN_KEY_SEED = 100
COUNTERFEIT_BREAKIN_KEY_SEED = 100