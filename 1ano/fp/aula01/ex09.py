start_time = 6 * 60 + 52

walk_distance = 1
walk_pace = 10
walk_time = walk_pace * walk_distance

sprint_distance = 3
sprint_pace = 6
sprint_time = sprint_pace * sprint_distance

back_distance = walk_distance + sprint_distance
back_time = walk_pace * back_distance

final_time = start_time + walk_time + sprint_time + back_time

print(f'Chegou a casa às {final_time // 60}:{final_time % 60:02d}')
