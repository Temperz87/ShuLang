// ShuLang does left to right for precedence
// In the event this comment becomes outdated h
// Hopefully I'll rembor to update this testcase
bind stuff : Integer to 1 + 2 * 3 * 4 + 5 - 6 + 7 * 8
print(stuff)

bind stuff : Integer to 2 * 3 + 4 * 5 * 5 - 100
print(stuff)
