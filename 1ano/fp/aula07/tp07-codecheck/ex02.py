# The periodic table of elements.
periodicTable = {
    "H": "Hydrogen", "C": "Carbon", "O": "Oxygen",
    "Fe": "Iron", "Au": "Gold", "Na": "Sodium",
    "Ag": "Silver", "Pb": "Lead", "Pu": "Plutonimum"
}

# Use the prompt "Enter symbol (or Q to quit): "
# Print either "Invalid symbol." if an error occurs
# or "element = element name" ("%s = %s")

element = input("Enter symbol (or Q to quit): ")
while element != "Q":
    try:
        print(element, "=", periodicTable[element])
    except KeyError:
        print("Invalid symbol.")
    element = input("Enter symbol (or Q to quit): ")
